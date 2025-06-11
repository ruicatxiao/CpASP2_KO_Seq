#!/usr/bin/env bash

# Usage:
#   chmod u+x nfcore_da.sh
#   ./nfcore_da.sh
#   Make sure to inout proper input files




nextflow run nf-core/differentialabundance \
    --input rnaseq_samplesheet_4da.csv \
    --contrasts contrasts.csv \
    --matrix salmon.merged.gene_counts.tsv \
    --transcript_length_matrix salmon.merged.gene_lengths.tsv \
    --gtf CpIOWAII.gtf \
    --outdir <OUTPUT_DIR>  \
    -profile rnaseq,docker \
    -c nfcore.config
