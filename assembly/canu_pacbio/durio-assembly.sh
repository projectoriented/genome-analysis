#!/bin/bash

canu -p durioz -d . genomeSize=500m -pacbio-raw ~/5_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz

canu -trim \
    -p durioz -d . \
    genomeSize=500m \
    -pacbio-corrected .durioz.correctedReads.fasta.gz

canu -assemble \
  -p durioz -d durioz-erate-0.030 \
  genomeSize=500m \
  correctedErrorRate=0.030 \
  -pacbio-corrected .durioz.trimmedReads.fasta.gz

canu -assemble \
  -p durioz -d durioz-erate-0.045 \
  genomeSize=500m \
  correctedErrorRate=0.045 \
  -pacbio-corrected .durioz.trimmedReads.fasta.gz

canu -assemble \
  -p durioz -d durioz-erate-0.055 \
  genomeSize=500m \
  correctedErrorRate=0.055 \
  -pacbio-corrected .durioz.trimmedReads.fasta.gz
