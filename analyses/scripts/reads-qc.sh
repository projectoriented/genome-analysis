module load bioinfo-tools
module load FastQC

dir=~/genome-analysis/analyses

fastqc $dir/data/raw_data/illumina_data/SRR6058604_scaffold_10.*P* --extract -o $dir/01*/illumina-fastqc/

fastqc $dir/data/raw_data/pacbio_data/SRR6037732_scaffold_10.fq.gz --extract -o $dir/01*/pacbio-fastqc/
