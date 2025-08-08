# data directory
data_dir=../raw
output_dir=../salmon_out
index=../ref/GRCh38/salmon_index

for g in $data_dir/*_R1_001.fastq.gz; do
    i1=$g
    i2=${g%_R1_001.fastq.gz}"_R2_001.fastq.gz" 
    o=${g#$data_dir/}
    sample=${o%_R1_001.fastq.gz}
    
    echo "Start processing sample $sample"
    #salmon paired-read
    salmon quant -i $index \
        -l A \
	    -1 $i1 \
        -2 $i2 \
        --validateMappings \
        -o $output_dir/$sample \
        -p 24 
    echo "Finished processing sample $sample"
    echo "----------"
done
