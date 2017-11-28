#!/bin/bash

#PBS -l mem=1gb,nodes=1:ppn=8,walltime=6:00:00
#PBS -m abe
#PBS -M vonde026@umn.edu
#PBS -q lab

set -e
set -u
set -o pipefail

#   Dependencies
module load bwa_ML/0.7.15
module load parallel

function indexFasta() {
	local fa_file="$1"
	local out_dir="$2"
	faName=`basename "${fa_file}" .fasta`
	bwa index "${fa_file}" > "${out_dir}"/"${faName}".fasta.fai
}

export -f indexFasta

#   Arguments provided by user
#   list of fasta files
FA_LIST=/home/morrellp/vonde026/scratch/Yeast/S288C_reference_genome_R64-2-1_20150113/Fasta_Sample_List.txt
#   where are our BAM files located?
OUT_DIR=/home/morrellp/vonde026/scratch/Yeast/S288C_reference_genome_R64-2-1_20150113

#   Do the work
parallel indexFasta {} "${OUT_DIR}" :::: "${FA_LIST}"
