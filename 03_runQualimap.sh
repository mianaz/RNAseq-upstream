# data directory
data_dir=../STAR_out
output_dir=../qc
gtf=../ref/GRCh38/GRCh38.gtf

for g in $data_dir/*.Aligned.sortedByCoord.out.bam; do 
    o=${g#$data_dir/}
    sample=${o%.Aligned.sortedByCoord.out.bam}
    
    echo "Start processing sample $sample"
    qualimap rnaseq -bam $g -gtf $gtf -outdir $output_dir/$sample --java-mem-size=32G
    echo "Finished processing sample $sample"
    echo "----------"
done
