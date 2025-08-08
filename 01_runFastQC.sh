data_dir=/Users/miana/Desktop/nepc_rnaseq/raw
output_dir=/Users/miana/Desktop/nepc_rnaseq/qc

if [ -d $output_dir ]; then
    echo "Output directory exists."
else
    mkdir $output_dir
fi

for g in $data_dir/*.fastq.gz; do

    fastqc $g -t 24 -o output_dir

done