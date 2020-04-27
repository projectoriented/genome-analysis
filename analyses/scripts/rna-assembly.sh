#!/bin/bash -l

#SBATCH -A g2020008
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 8:00:00
#SBATCH -J rna_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user meifang.wu.7427@student.uu.se

module load bioinfo-tools
module load star
module load trinity

dir=~/genome-analysis/analyses/02_genome_assembly
data=~/genome-analysis/analyses/data/raw_data/transcriptome/trimmed

files=( $(ls -d /home/mei/genome-analysis/analyses/data/raw_data/transcriptome/trimmed/*_scaffold_10.*.fastq.gz) )

for (( i=0; i<${#files[@]}; i+=2 ))
do
    p1=$(echo ${files[i]})
    p2=$(echo ${files[i+1]})
    sra=$(echo $p1 | grep -oE '\bSRR[0-9]{7}')

    #~/genome-analysis/analyses/scripts/rna-index-star.sh

    star \
	--runThreadN 8 \
	--limitBAMsortRAM 2616557322 \
	--genomeDir $dir/rna_star \
	--readFilesIn $p1 $p2 \
	--readFilesCommand gunzip -c \
	--outSAMtype BAM SortedByCoordinate \
	--outFileNamePrefix $dir/rna_star/$sra-star.

    Trinity \
	--genome_guided_bam $dir/rna_star/$sra*.bam \
	--genome_guided_max_intron 10000 \
	--max_memory 25G \
	--CPU 8 \
	--full_cleanup \ 
	--output $dir/rna_trinity/$sra-Trinity

# since full_cleanup doesn't work, manual cleanup is needed.
    ls $dir/rna_trinity/*/* -d | grep -v '.fasta' | xargs rm -rf

done
