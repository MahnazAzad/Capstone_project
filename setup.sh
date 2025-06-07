#script to set up analysis of E.coli variation for capstone project

#make subdirectories
mkdir data docs results

#copy over data
cp -r /work/binf8960/instructor_data/raw_fastq ./data/

#make it read-only
chmod -r data/raw_fastq/*.fastq*

