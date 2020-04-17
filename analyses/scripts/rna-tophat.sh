#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J rna_tophat
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load tophat

dir=~/genome-analysis/analyses/02_genome_assembly
data=~/genome-analysis/analyses/data/raw_data/transcriptome/trimmed

bowtie2-build \
    --large-index \
    --threads 8 \
    $dir/pilon_assembly/*.fasta $dir/rna_tophat/durioz.pilon

rm $dir/rna_tophat/durioz.pilon*{3,4}*

tophat \
    --num-threads 8 \
    --output-dir $dir/rna_tophat \
    $dir/rna_tophat/ $data/*10*.1.* $data/*10*.2.*

rm $dir/rna_tophat/durioz.pilon*.bt2l
