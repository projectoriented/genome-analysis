#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J rna_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load star

dir=~/genome-analysis/analyses/02_genome_assembly
data=~/genome-analysis/analyses/data/raw_data/transcriptome/trimmed
p1=/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_10.1.fastq.gz 
p2=/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_10.2.fastq.gz
sra=$(echo $p1 | sed s'/.*ed\///; s/_sc.*//')

~/genome-analysis/analyses/scripts/rna-index-star.sh

star \
    --runThreadN 8 \
    --limitBAMsortRAM 2616557322 \
    --genomeDir $dir/rna_star \
    --readFilesIn $p1 $p2\
    --readFilesCommand gunzip -c \
    --outSAMtype BAM SortedByCoordinate \
    --outFileNamePrefix $dir/rna_star/$sra-star.

module load trinity

Trinity \
    --genome_guided_bam /home/mei/genome-analysis/analyses/02_genome_assembly/rna_star/$sra*.bam \
    --genome_guided_max_intron 10000 \
    --max_memory 25G \
    --CPU 8 \
    --full_cleanup \
    --output /home/mei/genome-analysis/analyses/02_genome_assembly/rna_trinity/$sra-Trinity
