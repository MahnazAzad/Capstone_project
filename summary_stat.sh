# To make summary stat of the reads (raw, trimmed and alligned)

# To redirect the files to the tidy format file
#echo -e interprets this \t as a tab function to give distinction
#echo -e "filename\ttype\treads" > summary_stats.tsv

#for raw in data/raw_fastq/*.fastq.gz
#do 
#reads=$(zcat $raw | wc -l |awk '{print $1/4}')
#echo -e "$raw\traw\t$reads" >> summary_stats.tsv
#done 


#to calculate the number of reads in each trimmed fastq file and add that info into the existing summary_stats.tsv file
# Loop through all the trimmed FASTQ files in the specified folder
#for trim in data/trimmed_fastq/*.fastq.gz
#do
  # Print the file name (useful for tracking progress)
 # echo $trim

  # Count the total number of lines in the compressed file,
  # then divide by 4 to get the number of reads (since each read spans 4 lines)
  #reads=$(zcat $trim | wc -l | awk '{print $1/4}')

  # Add the filename, file type ('trimmed'), and read count to the summary table,
  # using tab characters for proper formatting
  #echo -e "$trim\ttrimmed\t$reads" >> summary_stats.tsv
#done

#To count how many reads are aligned (mapped) in each sorted .bam file
# Load the necessary tools
#module load SAMtools/1.18-GCC-12.3.0
#module load BCFtools/1.18-GCC-12.3.0 (probably it is not nedded in this step)

#echo -e "sample\taligned_reads" > aligned_counts.tsv

# Loop through each sorted BAM file
#for bam in results/bam/*.sorted.bam
#do
 # echo $bam  # print file name (for tracking)

  # Count only mapped reads (-F 0x4 excludes unmapped ones)
  #reads=$(samtools view -F 0x4 "$bam" | wc -l)

  # Append the sample name and aligned read count to the output summary file
  #echo -e "$bam\t$reads" >> aligned_counts.tsv
#done

#to count the number of varient sites in each VCF file and add the result to the sammary_stats.tsv file

# Load the necessary tools
module load BCFtools/1.18-GCC-12.3.0

# Loop through each VCF file 
for vcf in results/vcf/*.vcf
do
  echo $vcf  # Print the VCF filename for progress tracking

  # Count the number of variant records by excluding header lines (-H option)
  variants=$(bcftools view -H "$vcf" | wc -l)

  # Add a line to the summary file: file name, type ("variants"), and count
  echo -e "$vcf\tvariants\t$variants" >> summary_stats.tsv
done
