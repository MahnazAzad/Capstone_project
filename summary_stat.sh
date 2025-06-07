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
for trim in data/trimmed_fastq/*.fastq.gz
do
  # Print the file name (useful for tracking progress)
  echo $trim

  # Count the total number of lines in the compressed file,
  # then divide by 4 to get the number of reads (since each read spans 4 lines)
  reads=$(zcat $trim | wc -l | awk '{print $1/4}')

  # Add the filename, file type ('trimmed'), and read count to the summary table,
  # using tab characters for proper formatting
  echo -e "$trim\ttrimmed\t$reads" >> summary_stats.tsv
done
