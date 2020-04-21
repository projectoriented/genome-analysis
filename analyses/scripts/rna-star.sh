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

star \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir $dir/rna_star \
    --genomeSAindexNbases 12 \
    --genomeFastaFiles $dir/pilon_assembly/*.fasta 

star \
    --runThreadN 8 \
    --limitBAMsortRAM 2616557322 \
    --genomeDir $dir/rna_star \
    --readFilesIn /home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040093_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040096_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_10.1.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_10.1.fastq.gz  /home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040092_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040093_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040094_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040096_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6040097_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6156066_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6156067_scaffold_10.2.fastq.gz,/home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/SRR6156069_scaffold_10.2.fastq.gz \
    --readFilesCommand gunzip -c \
    --outSAMtype BAM SortedByCoordinate \
    --outFileNamePrefix $dir/rna_star/durioz-star.

~/genome-analysis/analyses/scripts/rna-trinity.sh
