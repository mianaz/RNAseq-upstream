#!/bin/bash

#$ -M <email>
#$ -m abe
#$ -q long
#$ -N fastp

conda activate rna-seq

od=.
gtf=./Ref/GRCm39/GRCm39_ens.gtf

if [ -d $od/Counts ]; then
    echo "directory exists"
else
    mkdir $od/Counts
fi

for g in $od/STAR/*.sort.bam; do 
    o=${g#$od/STAR/}
    sample=${o%.sort.bam}
    htseq-count -f bam -r pos -s no -m union -t exon -i gene_id $g $gtf > $od/Counts/$sample.csv
done
#for more information about the -m options, please see https://htseq.readthedocs.io/en/release_0.11.1/count.html
