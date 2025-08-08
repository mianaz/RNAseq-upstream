data_dir=/Users/miana/Desktop/nepc_rnaseq/raw
output_dir=/Users/miana/Desktop/nepc_rnaseq/STAR_out_custom
index=/Users/miana/Desktop/ref/others/star_combined_index
gtf=/Users/miana/Desktop/ref/others/GRCh38_combined.gtf

ulimit -n 2048

if [ -d $output_dir ]; then
    echo "Output directory exists."
else
    mkdir $output_dir
fi

for g in $data_dir/*_R1_001.fastq.gz; do
    i1=$g
    i2=${g%_R1_001.fastq.gz}"_R2_001.fastq.gz" 
    o=${g#$data_dir/}
    sample=${o%_R1_001.fastq.gz}

    #STAR paired-read
    STAR --runThreadN 24 \
         --readFilesIn $i1 $i2 \
         --genomeDir $index \
         --outSAMtype BAM SortedByCoordinate \
         --outSAMunmapped Within  \
         --quantMode GeneCounts  \
         --sjdbGTFfile $gtf \
	     --sjdbOverhang 149 \
	     --outFileNamePrefix $output_dir/$sample. \
	     --readFilesCommand "gunzip -c" 

done
