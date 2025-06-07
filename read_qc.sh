# Run the quality control on the raw data 

#creade directories
#mkdir results/fastqc_results
#mkdir results/multiqc-results

# Run the fastqc on individual raw data
#module load FastQC/0.11.9-Java-11
#fastqc -o results/fastqc_results data/raw_fastq/*.fastq.gz

#Run Multiqc to compile the FASTqc results
#module load MultiQC/1.14-foss-2022a
#multiqc -o results/multiqc-results results/fastqc_results

#Runs Trimmomatic in paired-end mode (PE) to trim adapters and filter out low-quality reads.

#module load Trimmomatic/0.39-Java-13
#TRIMMOMATIC="java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar"

#mkdir data/trimmed_fastq

#for fwd in data/raw_fastq/*_1.fastq.gz
#do
 #   sample=$(basename $fwd _1.fastq.gz)
  #  rev="data/raw_fastq/${sample}_2.fastq.gz"

   # echo "Processing sample: $sample"
#
 #   $TRIMMOMATIC PE \
  #  data/raw_fastq/${sample}_1.fastq.gz data/raw_fastq/${sample}_2.fastq.gz \
   # data/trimmed_fastq/${sample}_1.paired.fastq.gz data/trimmed_fastq/${sample}_1.unpaired.fastq.gz \
    #data/trimmed_fastq/${sample}_2.paired.fastq.gz data/trimmed_fastq/${sample}_2.unpaired.fastq.gz \
    #ILLUMINACLIP:data/raw_fastq/NexteraPE-PE.fa:2:30:10 \
    #LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
#done


#Run fastqc on my trimmed reads

# Run the fastqc on individual raw data
#module load FastQC/0.11.9-Java-11
#mkdir data/fastqc_trimmed_results
#fastqc -o data/fastqc_trimmed_results data/trimmed_fastq/*.fastq.gz

#Run Multiqc to compile the trimmed FASTqc results
module load MultiQC/1.14-foss-2022a
mkdir data/multi_fastqc_trimmed_results
multiqc -o data/multi_fastqc_trimmed_results data/fastqc_trimmed_results
