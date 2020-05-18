#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J counts-htseq-indiv
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load samtools
module load htseq

data=/home/mei/genome-analysis/analyses/02_genome_assembly/rna_star
dir=/home/mei/genome-analysis/analyses/03_annotations/counts-htseq

files=( $(ls -d $data/*-star.Aligned.sortedByCoord.out.bam) )

for (( i=0; i<${#files[@]}; i++ )); do
    sra=$(echo ${files[i]} | grep -oE '\bSRR[0-9]{7}')
    samout=$dir/$sra.out.sorted.sam

    samtools sort -n -o $samout -O sam ${files[i]}

    htseq-count $samout /home/mei/genome-analysis/analyses/03_annotations/durioz.pilon.maker.output/durioz.pilon.all.gtf > $dir/$sra.durioz.pilon-counts.txt

    rm $samout
done
