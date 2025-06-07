# To make summary stat of the reads (raw, trimmed and alligned)

# To redirect the files to the tidy format file
echo -e interprets this \t as a tab function to give distinction
echo -e "filename\ttype\treads" > summary_stats.tsv

for raw in data/raw_fastq/*.fastq.gz
do 
reads=$(zcat $raw | wc -l |awk '{print $1/4}')
echo -e "$raw\traw\t$reads" >> summary_stats.tsv
done 

