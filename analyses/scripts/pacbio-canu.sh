#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#1;95;0cSBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J all-pac2ill
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load canu

dir=~/genome-analysis/analyses
dir_re=$dir/01_preprocessing

canu -correct \
    -p durioz -d $dir_re/correction_canu \
    genomeSize=24162007 \
    executiveThreads=8 \
    executiveMemory=25.6 \
    -pacbio-raw $dir/data/raw_data/pacbio_data/SRR6037732_scaffold_10.fq.gz 

canu -trim \
    -p durioz -d $dir_re/correction_canu \
    genomeSize=24162007 \
    executiveThreads=8 \
    executiveMemory=25.6 \
    -pacbio-corrected $dir_re/correction_canu/durioz.correctedReads.fasta.gz

canu -assemble \
    -p durioz -d $dir/02*/canu_assembly \
    genomeSize=24162007 \
    executiveThreads=8 \
    executiveMemory=25.6 \
    -pacbio-corrected $dir_re/correction_canu/durioz.trimmedReads.fasta.gz


# Load modules for illumina-bwa.sh
module load FastQC
module load bwa
module load samtools

$dir/scripts/illumina-bwa.sh
