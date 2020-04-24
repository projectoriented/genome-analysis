#!/bin/bash

dir=~/genome-analysis/analyses/02_genome_assembly

star \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir $dir/rna_star \
    --genomeSAindexNbases 12 \
    --genomeFastaFiles $dir/pilon_assembly/*.fasta 
