# CpASP2_KO_Seq
Scripts and analysis used for studying of C. parvum ASP2 knockouts


![Image](https://github.com/user-attachments/assets/b0cdab90-5ada-4742-aaee-bbcdca37a6e2)


## Description
This repo houses the code used for analyzing ASP2 knock out in the apicomplexa parasite Cryptosporidium parvum. 


## Abstract
(PLACEHOLDER)


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
├── contrasts.csv						# Comparison list for nf-core/differentialabundance
├── nfcore_rnaseq.sh					# Shell script for executiong nf-core/rnaseq
├── nfcore_da.sh						# Shell scriopt for executing nf-core/differentialabundance
├── rnaseq_samplesheet.csv				# Samplesheet for rnaseq
├── rnaseq_samplesheet_4da.csv			# Samplesheet for differentialabundance
└── asp2_da_to_singlecell.R				# R scripts for analyzing DESeq2 results with single cell

```


## Credits

- This ASP2 manuscript lead author is Bethan A. Wallbank

- The analysis pipeline is conceptualized by Rui Xiao and Bethan A. Wallbank. 

- The pipeline is developed and implemented by Rui Xiao

## Data availability
- The RNAseq data generated for this study is available through PRJNA1274990.
- The scRNAseq data previously generated is available through GSE232438.

## Citations

"PLACE HOLDER FOR MANUSCRIPT DOI"
