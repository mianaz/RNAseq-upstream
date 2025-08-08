data_dir=../raw
output_dir=../STAR_out
index=../ref/GRCh38/index
gtf=/ref/GRCh38/GRCh38.gtf

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
