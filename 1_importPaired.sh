#!/usr/bin/env bash

# Qiime2Pipe
# Import FASTq File 
# 01 - Import 1.8 Illumina Paired End 	(OK)
# 02 - Import 1.8 Illumina Single End 	(to do)
# 03 - Import Fastq Manifest 		(to do)
# 04 - Import other formats		(to do)
# 05 - Error control			(to do)
# 06 - Arguments structure		(to do)

fastqdir=$1
artdir=$2

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path "${fastqdir}" \
  --source-format CasavaOneEightSingleLanePerSampleDirFmt \
  --output-path "${artdir}/demux-paired-end.qza


