library(Seurat)
library(ggplot2)
library(dplyr)


# all.rds is obtained from Katie single cell paper
# Up and down files are gene IDs from DESeq2 differential expression analysis
seurat_file <- "all.rds"
up_file      <- "asp2_v_wt_up.tsv"
down_file    <- "asp2_v_wt_down.tsv"

seurat_obj <- readRDS(seurat_file)

up_df <- read.delim(up_file, header = FALSE, stringsAsFactors = FALSE)
colnames(up_df) <- c("gene", "log2fc")

down_df <- read.delim(down_file, header = FALSE, stringsAsFactors = FALSE)
colnames(down_df) <- c("gene", "log2fc")

DefaultAssay(seurat_obj) <- "RNA"

valid_up_genes   <- intersect(up_df$gene, rownames(seurat_obj))
if (length(valid_up_genes) == 0) stop("No valid up-regulated genes found.")
up_df   <- up_df[up_df$gene %in% valid_up_genes, ]

valid_down_genes <- intersect(down_df$gene, rownames(seurat_obj))
if (length(valid_down_genes) == 0) stop("No valid down-regulated genes found.")
down_df <- down_df[down_df$gene %in% valid_down_genes, ]

up_data <- GetAssayData(seurat_obj, assay = "RNA", layer = "data")[up_df$gene, , drop = FALSE]
down_data <- GetAssayData(seurat_obj, assay = "RNA", layer = "data")[down_df$gene, , drop = FALSE]

logfc_up   <- setNames(up_df$log2fc, up_df$gene)
sum_up_lfc <- sum(logfc_up)
up_vec     <- colSums(up_data   * matrix(logfc_up[rownames(up_data)],   nrow=nrow(up_data),   ncol=ncol(up_data),   byrow=FALSE))

logfc_down   <- setNames(down_df$log2fc, down_df$gene)
sum_down_lfc <- sum(logfc_down)
down_vec     <- colSums(down_data * matrix(logfc_down[rownames(down_data)], nrow=nrow(down_data), ncol=ncol(down_data), byrow=FALSE))

cells      <- Cells(seurat_obj)
common_up   <- intersect(cells, names(up_vec))
common_down <- intersect(cells, names(down_vec))
if (length(common_up) == 0)   stop("No overlapping cells for up-regulated data.")
if (length(common_down) == 0) stop("No overlapping cells for down-regulated data.")

seurat_obj$UpWeightedExpr   <- NA
seurat_obj$DownWeightedExpr <- NA

seurat_obj$UpWeightedExpr[common_up]   <- if (sum_up_lfc   != 0) up_vec[common_up]   / sum_up_lfc   else 0
seurat_obj$DownWeightedExpr[common_down] <- if (sum_down_lfc != 0) down_vec[common_down] / sum_down_lfc else 0



# Plot: UMAP up-regulated weighted expression
FeaturePlot(seurat_obj, features="UpWeightedExpr", reduction="umap") +
  scale_color_gradient(low="white", high="red") +
  ggtitle("ASP2_vs_WT_48H, Up-Regulated Weighted single cell RNA Expression")

# Plot: UMAP down-regulated weighted expression
FeaturePlot(seurat_obj, features="DownWeightedExpr", reduction="umap") +
  scale_color_gradient(low="white", high="blue") +
  ggtitle("ASP2_vs_WT_48H, RDown-Regulated Weighted single cell RNA Expression")

up_thresh <- 0.5; down_thresh <- 0.5
cat <- ifelse(
  seurat_obj$UpWeightedExpr   > up_thresh & seurat_obj$DownWeightedExpr > down_thresh, "both",
  ifelse(seurat_obj$UpWeightedExpr > up_thresh, "up",
    ifelse(seurat_obj$DownWeightedExpr > down_thresh, "down", "none")
  )
)
seurat_obj$UpDownCategory <- factor(cat, levels=c("none","up","down","both"))

# Plot: categorical UMAP of cells by UpDownCategory
# This is the plot featured in the manuscript
DimPlot(seurat_obj, reduction="umap", group.by="UpDownCategory") +
  scale_color_manual(values=c("none"="grey","up"="red","down"="blue")) +
  ggtitle("UMAP: ASP2_vs_WT Cells with Up and Down")

df <- data.frame(Cluster=seurat_obj$Cluster, Category=seurat_obj$UpDownCategory)
df_counts <- df %>% group_by(Cluster, Category) %>% summarize(n=n(), .groups="drop")

# Plot: 100% stacked bar chart by cluster
ggplot(df_counts, aes(x=Cluster, y=n, fill=Category)) +
  geom_bar(stat="identity", position="fill") +
  scale_fill_manual(values=c("none"="grey","up"="red","down"="blue","both"="purple")) +
  labs(x="Cluster Number", y="Proportion of Cells", title="100% Stacked Bar Chart by Cluster") +
  theme_bw()
