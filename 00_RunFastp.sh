#!/bin/bash

#$ -M <email>
#$ -m abe
#$ -q long
#$ -N fastp

conda activate rna-seq

#specify output directory
od=.

#make output folder

if [ -d $od/fastp ]; then
    echo "directory exists"
else
    mkdir $od/fastp
fi

echo "Doing one-step QC and trimming with Fastp..."

for g in Input_files/*_R1*; do    #######IF YOUR READS ARE *R1*, please change this to *R1* instead of *_1*
    i1=$g
    i2=${g%_R1*}"_R2*"                     #######IF YOUR READS ARE *R1*, please change this to %_R1* and _R2* instead of _1* and _2*
    o=${g#Input_files/}
    sample=${o%_R1*}                     #######IF YOUR READS ARE *R1*, please change this to o%R1 instead of *_1*

    fastp --in1 $i1  \
          --in2 $i2  \
          --out1 $od/fastp/$sample\_1.clean.fq  \
          --out2 $od/fastp/$sample\_2.clean.fq  \
          --unpaired1 $od/fastp/$sample.unpaired.fq  \
          --unpaired2 $od/fastp/$sample.unpaired.fq  \ 
done

echo "Done QC and trimming with Fastp!"