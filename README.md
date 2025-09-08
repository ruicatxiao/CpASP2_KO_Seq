# CpASP2_KO_Seq
Scripts and analysis used for studying of C. parvum ASP2 knockouts


![Image](https://github.com/user-attachments/assets/b0cdab90-5ada-4742-aaee-bbcdca37a6e2)


## Description
This repo houses the code used for analyzing ASP2 knock out in the apicomplexa parasite Cryptosporidium parvum. 


## Abstract
The parasite Cryptosporidium causes severe diarrheal disease that can be life-threatening, and effective treatments are sorely lacking. Recently, aspartyl proteases (ASP) have emerged as targets with significant therapeutic potential in several related parasites resulting in the development of multiple potent leads. ASPs are critical to the proteolytic activation and maturation of secretory proteins parasites rely on to invade, manipulate, and upon completion of their replication cycle exit the host cells in which they reside. The Cryptosporidium genome encodes five ASPs, which have not been previously studied. Here we explore two of these enzymes and in genetic experiments find one, CpASP2, to be essential to parasite growth. Conditional deletion of the gene encoding this protease leads to arrest at two distinct points in the lifecycle. Cell biological studies of the mutant phenotype demonstrate that CpASP2 is required for egress of both asexual merozoites and male gametes. Mutant parasites appear to complete intracellular development yet are paralyzed and incapable of responding to stimuli that trigger motility and egress in wild type. Ablation of CpASP2 in infected mice leads to rapid parasite clearance highlighting the promise of CpASP2 and likely additional related enzymes as multi-stage targets of therapy.


## Dependencies (Tested working for this pipeline)
- Java (v17 to 24)
- Docker (follow default installation)
- Nextflow (v24.10.5)
- R (v4.5.0)
- Seurat (v5.3.0)
- ggplot2 (v3.5.2)
- dplyr (v1.1.4)

## Usage

1. Ensure all required dpendencies is installed and available in your `$PATH`
2. Clone this repository:
   ```bash
   git clone https://github.com/ruicatxiao/CpASP2_KO_Seq.git
   cd CpASP2_KO_Seq
   chmod u+x nfcore_rnaseq.sh
   chmod u+x nfcore_da.sh
   ```

## Directory Structure

```
.
├── contrasts.csv				# Comparison list for nf-core/differentialabundance
├── nfcore_rnaseq.sh			   # Shell script for executiong nf-core/rnaseq
├── nfcore_da.sh				# Shell scriopt for executing nf-core/differentialabundance
├── rnaseq_samplesheet.csv		   # Samplesheet for rnaseq
├── rnaseq_samplesheet_4da.csv	   # Samplesheet for differentialabundance
└── asp2_da_to_singlecell.R		   # R scripts for analyzing DESeq2 results with single cell

```


## Credits

- This ASP2 manuscript lead author is Bethan A. Wallbank

- The analysis pipeline is conceptualized by Rui Xiao and Bethan A. Wallbank. 

- The pipeline is developed and implemented by Rui Xiao

## Data availability
- The RNAseq data generated for this study is available through PRJNA1274990.
- The scRNAseq data previously generated is available through GSE232438.

## Citations

Wallbank BA, Smith EJ, Carrasco JED, Xiao R, Walzer KA, Riley JR, Striepen B. Cryptosporidium aspartyl protease 2 is required for host cell egress of merozoites and male gametes. Mol Biol Cell. 2025 Sep 3:mbcE25060306. doi: 10.1091/mbc.E25-06-0306. PMID: 40901734.
