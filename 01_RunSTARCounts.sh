#!/bin/bash

#$ -M <email>
#$ -m abe
#$ -q long
#$ -N fastp

conda activate rna-seq

# output directory
od=.
ref=./Ref/GRCm39/index # replace with your reference genome directory
gtf=./Ref/GRCm39_ens.gtf # replace with your gtf file

if [ -d $od/STAR ]; then
    echo "directory exists"
else
    mkdir $od/STAR
fi

for g in $od/fastp/*.fq; do
    i1=$g
    i2=${g%_1.clean.fq}"_2.clean.fq" 
    o=${g#$od/fastp/}
    sample=${o%_1.clean.fq}

    #STAR paired-read
    STAR --runThreadN 16 \
        --readFilesIn $i1 $i2 \
        --genomeDir $ref \
        --outSAMtype BAM Unsorted SortedByCoordinate\
        --outFileNamePrefix $od/STAR/$sample. \
        --outSAMunmapped Within  \
        --quantMode GeneCounts  \
        --sjdbGTFfile $gtf

done
