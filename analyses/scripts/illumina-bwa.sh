#!/bin/bash

dir=~/genome-analysis/analyses

# Although I won't need to quality check the Illumina sequence as they seem to already be trimmed. I will still run it through to see the quality post-trimmed.
fastqc $dir/data/raw_data/illumina_data/SRR6058604_scaffold_10.*P* --extract -o $dir/01*/illumina-fastqc/

# Align the paired illumina reads to a PacBio assembly generated by Canu. 
dir_align=$dir/01_preprocessing/illumina-bwa

bwa index -p durioz $dir/02*/durioz.contigs.fasta > $dir_align
bwa mem -t 8 \
    $dir/02*/durioz.contigs.fasta $dir/data/raw_data/illumina_data/SRR6058604_scaffold_10.1P.fastq.gz $dir/data/raw_data/illumina_data/SRR6058604_scaffold_10.2P.fastq.gz > $dir_align/SRR6058604-aln.sam

# Analyze the alignments in SAM/BAM format with samtools
samtools view -b -@ 8 $dir_align/SRR6058604-aln.sam | \
    samtools sort > $dir_align/SRR6058604-aln-sorted.bam

samtools index $dir_align/SRR6058604-aln-sorted.bam 
samtools faidx $dir/02*/durioz.contigs.fasta 

# Pilon
pilon \
    --genome $dir/02*/durioz.contigs.fasta \
    --frags $dir_align/SRR6058604-aln-sorted.bam \
    --output durioz-pilon \
    --outdir $dir/02_genome_assembly/pilon_assembly/ \
    --threads 8 \
    --diploid
