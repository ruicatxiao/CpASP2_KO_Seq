#!/usr/bin/env bash

# Usage:
#   chmod u+x nfcore_rnaseq.sh
#   ./nfcore_rnaseq.sh
#   Make sure to adjust output folder, GTF files, genome files before 
#   --alignIntronMax 2500 is set to avoid intron mapping spanning entire chromosomes


nextflow -bg run nf-core/rnaseq \
    --input rnaseq_samplesheet.csv \
    --outdir <OUTPUT_DIR> \
    --gtf CpIOWAII.gtf \
    --fasta CpIOWAII.fasta \
    -profile docker \
    --extra_star_align_args "--alignIntronMax 2500" \
    --remove_ribo_rna  TRUE \
    --pseudo_aligner star_salmon \
    --pseudo_aligner salmon \
    --contaminant_screening kraken2 \
    --kraken_db <K2_DB> \
    --skip_bbsplit FALSE \
    --bbsplit_fasta_list bbsplit_genome_list.csv \
    --min_mapped_reads 0.001 \
    -bg \
    -c nfcore.config >> log.txt &

