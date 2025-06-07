# script to allign the genome

\set -e #This set up is to stop the code if error come up



# Download the genome from this url
#genome_url="ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/017/985/GCA_000017985.1_ASM1798v1/GCA_000017985.1_ASM1798v1_genomic.fna.gz"

#To download E.coli genome from the above url and unzip it

#mkdir data/genomes
#wget -O data/genomes/ecoli_rel606.fna.gz $genome_url
#gunzip data/genomes/ecoli_rel606.fna.gz

# Load the required modules 


# Load Sam 
#module load SAMtools/1.18-GCC-12.3.0 

# Load bcftools
#module load BCFtools/1.18-GCC-12.3.0 


#Index the genome
# Index the complete genome of E. coli
# bwa is one of the indexing tool
#Load BWA
module load BWA/0.7.18-GCCcore-13.3.0
bwa index data/genomes/ecoli_rel606.fna
