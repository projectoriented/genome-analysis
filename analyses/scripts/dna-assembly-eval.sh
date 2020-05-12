#!/bin/bash

module load bioinfo-tools
module load quast

dir=/home/mei/genome-analysis/analyses

quast.py $dir/02_genome_assembly/pilon_assembly/durioz.pilon.fasta \
    -R $dir/data/NSDW01000010.1.fasta \
    -t 8 \
    -o $dir/02_genome_assembly/quast_evaluation/genome

quast.py $dir/02_genome_assembly/rna_trinity/*fasta \
    -R $dir/data/NSDW01000010.1.fasta \
    -t 8 \
    -o $dir/02_genome_assembly/quast_evaluation/transcriptome


