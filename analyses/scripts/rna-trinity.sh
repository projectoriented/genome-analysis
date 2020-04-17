#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 8:00:00
#SBATCH -J rna-trinity
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load trinity

'
Trinity --seqType fq \
    --left ~/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/*10.1.* \
    --right ~/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/*10.2.* \
    --CPU 8 \
    --max_memory 25G \
    --output ~/genome-analysis/analyses/02_genome_assembly/rna_trinity
'

Trinity --genome_guided_bam ~genome-analysis/analyses/02_genome_assembly/rna_tophat/*.bam \
    --max_memory 25G \
    --CPU 8 \
    
