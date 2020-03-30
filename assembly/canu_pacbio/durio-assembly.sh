#!/bin/bash 


# Load modules
module load bioinfo-tools
module load canu

canu -correct \
    -p durioz -d . \
    genomeSize=800m \
    executiveThreads=2 \
    -pacbio-raw ~/5_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz

canu -trim \
    -p durioz -d . \
    genomeSize=800m \
    executiveThreads=2 \
    -pacbio-corrected ./durioz.correctedReads.fasta.gz

canu -assemble \
  -p durioz -d durioz-erate-0.030 \
  genomeSize=800m \
  executiveThreads=2 \
  correctedErrorRate=0.030 \
  -pacbio-corrected ./durioz.trimmedReads.fasta.gz

canu -assemble \
  -p durioz -d durioz-erate-0.045 \
  genomeSize=800m \
  executiveThreads=2 \
  correctedErrorRate=0.045 \
  -pacbio-corrected ./durioz.trimmedReads.fasta.gz

canu -assemble \
  -p durioz -d durioz-erate-0.055 \
  genomeSize=800m \
  executiveThreads=2 \
  correctedErrorRate=0.055 \
  -pacbio-corrected ./durioz.trimmedReads.fasta.gz
