# data directory
data_dir=/Users/miana/Desktop/nepc_rnaseq/STAR_out
output_dir=/Users/miana/Desktop/nepc_rnaseq/qc
ANTHROPIC_TOKEN=
for g in $data_dir/*.Aligned.sortedByCoord.out.bam; do 
    o=${g#$data_dir/}
    sample=${o%.Aligned.sortedByCoord.out.bam}
    
    echo "Start processing sample $sample"
    multiqc $output_dir/$sample --outdir $output_dir/$sample --ai-summary-full --ai-provider anthropic
    echo "Finished processing sample $sample"
    echo "----------"
done
