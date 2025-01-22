#!/bin/bash

#$ -M <email>
#$ -m abe
#$ -q long
#$ -N star-build

#conda activate ngs

echo "Building genome index with STAR..."

#human
#mkdir GRCh38/index
#STAR --runThreadN 16 \
#     --runMode genomeGenerate \
#     --genomeDir GRCh38/index \
#     --genomeFastaFiles GRCh38/GRCh38_genomic.fa \
#     --sjdbGTFfile GRCh38/GRCh38_ens.gtf \ # use basic annotation
#     --sjdbOverhang 149 # this should be read length-1

#mouse
mkdir GRCm39/index
STAR --runThreadN 16 \
     --runMode genomeGenerate \
     --genomeDir GRCm39/index \
     --genomeFastaFiles GRCm39/GRCm39_genomic.fa \
     --sjdbGTFfile GRCm39/GRCm39_ens.gtf \
     --sjdbOverhang 149

echo "Done building genome index with STAR!"
