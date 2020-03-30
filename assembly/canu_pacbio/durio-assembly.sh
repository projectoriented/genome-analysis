#!/bin/bash

canu -p durioz -d . genomeSize=500m -pacbio-raw ~/5_Tean_Teh_2017/pacbio_data/SRR6037732_scaffold_10.fq.gz

canu -trim \
    -p durioz -d . \
    genomeSize=500m \
    -pacbio-corrected .durioz.correctedReads.fasta.gz

canu -assemble \
  -p durioz -d . ecoli-erate-0.039 \
  genomeSize=500m \
  correctedErrorRate=0.039 \
  -pacbio-corrected ecoli/ecoli.trimmedReads.fasta.gz
