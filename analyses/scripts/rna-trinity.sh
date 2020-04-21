#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J rna_trinity
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load trinity

Trinity \
    --genome_guided_bam /home/mei/genome-analysis/analyses/02_genome_assembly/rna_star/durioz-star.Aligned.sortedByCoord.out.bam \
    --genome_guided_max_intron 10000 \
    --max_memory 25G \
    --CPU 8 \
    --full_cleanup \
    --output /home/mei/genome-analysis/analyses/02_genome_assembly/rna_trinity
    
