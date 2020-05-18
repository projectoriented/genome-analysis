#!/bin/bash

# This script generates a table format input for DEseq2, an R package. It has to be run in the directory of all the HTseq count outputs.

for f in "$@"
do
    n=${f%%.*}
    c=$(cat $f | cut -f2); echo "$c" > test_$n.txt

    
    printf "\t"$n
done | sed '1 s/^/pilon/; s/$/\n/' > all-counts.tsv

cat SRR6040092.durioz.pilon-counts.txt | cut -f1 > test_SRR6040091.txt # This column is necessary for the gene_ids.

paste test_SRR6* | column -t >> all-counts.tsv
rm test_*.txt
