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

# 1. EEstats
## Gets stats from the fastq dir, for every sample

usearch_1_eestats() {


	dir_in=$1
	dir_out=$2
	p_threads=$3

	for fq in ${dir_in}/*.fastq; do
		
		bn=`basename $fq .fastq`
		echo "Starting run for $fq"

		usearch11 \
			-fastx_info $fq \
			-output ${dir_out}/${bn}.fastx.info.txt

		usearch11 \
			-fastq_eestats $fq \
			-output ${dir_out}/${bn}.eestats1.txt \
			-threads ${p_threads}

		usearch11 \
			-fastq_eestats2 $fq \
			-output ${dir_out}/${bn}.eestats2.txt \
			-threads ${p_threads} \
			-length_cutoffs 150,350,25

		echo "Quality measures OK for $fq"

	done
}
