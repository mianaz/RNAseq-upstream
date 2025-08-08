# data directory
data_dir=/Users/miana/Desktop/nepc_rnaseq/STAR_out
output_dir=/Users/miana/Desktop/nepc_rnaseq/qc
gtf=/Users/miana/Desktop/ref/human/gencode.v47.primary_assembly.basic.annotation.gtf

for g in $data_dir/*.Aligned.sortedByCoord.out.bam; do 
    o=${g#$data_dir/}
    sample=${o%.Aligned.sortedByCoord.out.bam}
    
    echo "Start processing sample $sample"
    qualimap rnaseq -bam $g -gtf $gtf -outdir $output_dir/$sample --java-mem-size=32G
    echo "Finished processing sample $sample"
    echo "----------"
done
