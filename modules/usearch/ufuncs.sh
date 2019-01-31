#!/usr/bin/env bash
#
#
# BSD 2-Clause License
#
# Copyright (c) 2018, Rafael Correia da Silva
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# # * Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## USEARCH functions

# 1. EEstats - gets stats from the fastq dir, for every sample
##	Input: directory with fastq files
##	Output format: txt files
##	Output directory: preproc

# 2. search_oligodb: looks for sequencing artifacts on the sequences
##	Input: directory with fastq files
##	Output format: txt files
##	Output directory: preproc


### Function 1: eestats
usearch_1_eestats() {

	dir_in=$1
	dir_out=$2
	p_threads=$3

	for fq in ${dir_in}/*.fastq; do
		
		bn=`basename $fq .fastq`
		echo "Starting run for $fq"
		mkdir -p ${dir_out}/1_eestats/${bn}

		## First section: fasxt_info

		if [ ! -f ${dir_out}/1_eestats/${bn}/fastx.info.txt ] || [ $overwrite_usearch = "True" ]; then 
			
			echo "Starting usearch..."
			echo "TEST"
			echo "TEST"
			echo "TEST"
			usearch11 \
				-fastx_info $fq \
				-output ${dir_out}/1_eestats/${bn}/fastx.info.txt

		else 
			echo "File ${bn}/fastx.info.txt already exists. Skipping..."

		fi

		## Second section: eestats (simpler)

		if [ ! -f ${dir_out}/1_eestats/${bn}/eestats1.txt ] || [ $overwrite_usearch = "True" ]; then

			usearch11 \
				-fastq_eestats $fq \
				-output ${dir_out}/1_eestats/${bn}/eestats1.txt \
				-threads ${p_threads}
		else
			echo "File ${bn}/eestats1.txt already exists. Skipping..."

		fi

		## Third section: eestats (robust)
		
		if [ ! -f ${dir_out}/1_eestats/${bn}/eestats2.txt ] || [ $overwrite_usearch = "True" ]; then

			usearch11 \
				-fastq_eestats2 $fq \
				-output ${dir_out}/1_eestats/${bn}/eestats2.txt \
				-threads ${p_threads} \
				-ee_cutoffs 2.0,4.0,6.0 \
				-length_cutoffs 150,350,25

		else
			echo "${bn}/eestats2.txt already exists. Skipping..."

		fi

		echo "Quality measures OK for $fq"

	done
}



# ----- ########################### --- #
# ----- ### Function 2: oligodb ### --- #
# ----- ########################### --- #

usearch_2_oligodb() {

	dir_in=$1
	dir_out=$2
	oligos=$3

	for fq in ${dir_in}/*.fastq; do
		
		bn=`basename $fq .fastq`
		mkdir -p ${dir_out}/2_oligodb/${bn}
	
	if [ ! -f ${dir_out}/2_oligodb/${bn}/oligos.txt ] || [ $overwrite_usearch = "True" ]; then

			usearch11 \
				-search_oligodb $fq \
				-db $oligos \
				-strand both \
				-userout ${dir_out}/2_oligodb/${bn}/oligos.txt \
				-threads ${p_threads} \
				-userfields query+qlo+qhi+qstrand
		else

			echo "File ${dir_out}/2_oligodb/${bn}/oligos.txt already exists. Skipping.."

		fi


	done

}


usearch_3_mergepairs() {
	
	dir_in=$1
	dir_out=$2

	mkdir -p ${dir_out}/processed

        if [ ! -f ${dir_out}/processed/merged.fq ] || [ $overwrite_usearch = "True" ]; then

		usearch11 \
			-fastq_mergepairs ${dir_in}/*R1.fastq \
			-fastqout ${dir_out}/processed/merged.fq \
			-relabel @ \
			-fastq_maxdiffs 10 \
			-fastq_pctid 80 \
			-report ${dir_out}/merge_log.txt 

		echo "Running FastQC on merged file..."
		fastqc -o ${dir_out}/processed -q ${dir_out}/processed/merged.fq

	else
		echo "Already merged. Skipping..."

	fi
}

