#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J mummerplot
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load MUMmer

ref=/home/mei/genome-analysis/analyses/data/NSDW01000010.1.fasta

paths=("/home/mei/genome-analysis/analyses/02_genome_assembly/pilon_assembly/durioz.pilon.fasta" "/home/mei/genome-analysis/analyses/02_genome_assembly/canu_assembly/durioz.contigs.fasta")

out=/home/mei/genome-analysis/analyses/02_genome_assembly/mummer-evaluation

for i in ${paths[*]}
do
    prefix="$out/nucmer-$(echo $i | cut -f7 -d'/')"

    nucmer --maxmatch --threads=4 -p $prefix $ref $i
    
    show-coords -r -c -l $prefix.delta > $prefix.coords
    show-snps -C $prefix.delta > $prefix.snps
    show-tiling $prefix.delta > $prefix.tiling 

    mummerplot --layout --medium -R $ref -Q $i -p $prefix $prefix.delta
done
