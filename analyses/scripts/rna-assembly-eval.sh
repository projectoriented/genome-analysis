#!/bin/bash

module load bioinfo-tools
module load bowtie2
module load samtools

dir=/home/mei/genome-analysis/analyses/02_genome_assembly/rna_trinity
data=/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed

bowtie2-build $dir/Concat-Trinity-GG.fasta $dir/Concat-Trinity-GG.fasta
bowtie2 -p 8 -q --no-unal -k 20 -x $dir/Concat-Trinity-GG.fasta -1 $data/*10.1.* -2 $data/*10.2.* \
    2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam

cat 2>&1 align_stats.txt
