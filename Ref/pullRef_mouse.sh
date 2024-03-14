#!/bin/bash

#$ -M <email>
#$ -m abe
#$ -q debug
#$ -N PullRef

#download mouse reference genome from NCBI
echo 'Downloading mouse reference genome GRCm39..'

mkdir GRCm39

#wget 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.fna.gz'
#gunzip GCF_000001635.27_GRCm39_genomic.fna.gz
#mv GCF_000001635.27_GRCm39_genomic.fna GRCm39/GRCm39_refseq.fa

#wget 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gff.gz'
#gunzip GCF_000001635.27_GRCm39_genomic.gff.gz
#mv GCF_000001635.27_GRCm39_genomic.gff GRCm39/GRCm39_refseq.gff

#Uncomment if using STAR to build index, which uses gtf format
#wget 'https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/635/GCF_000001635.27_GRCm39/GCF_000001635.27_GRCm39_genomic.gtf.gz'
#gunzip GCF_000001635.27_GRCm39_genomic.gtf.gz
#mv GCF_000001635.27_GRCm39_genomic.gtf GRCm39/GRCm39_refseq.gtf

# Download mouse reference genome from Ensembl
wget 'https://ftp.ensembl.org/pub/release-111/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz'
gunzip Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
mv Mus_musculus.GRCm39.dna.primary_assembly.fa GRCm39/GRCm39_genomic.fa

wget 'https://ftp.ensembl.org/pub/release-111/gtf/mus_musculus/Mus_musculus.GRCm39.111.gtf.gz'
gunzip Mus_musculus.GRCm39.111.gtf.gz
mv Mus_musculus.GRCm39.111.gtf GRCm39/GRCm39_gtf.gtf

# uncomment if a gff3 format is preferred
#wget 'https://ftp.ensembl.org/pub/release-111/gff3/mus_musculus/Mus_musculus.GRCm39.111.gff3.gz'
#gunzip Mus_musculus.GRCm39.111.gff3.gz                
#mv Mus_musculus.GRCm39.111.gff3 GRCm39/GRCm39_ens.gff3

echo 'DONE downloading mouse reference genome GRCm39!'
