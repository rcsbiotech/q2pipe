#!/usr/bin/env bash

artdir=$1
threads=$2
trim_length=$3

mkdir -p "${artdir}/deblur-out"

echo "Beginning quality-filter q-score (0/2)"

qiime quality-filter q-score \
	--i-demux ${artdir}/demux-paired-end.qza \
	--p-min-quality 4 \
	--p-quality-window 3 \
	--p-min-length-fraction 0.75 \
	--p-max-ambiguous 0 \
	--quiet \
	--o-filter-stats ${artdir}/deblur-filter-stats.qza \
	--o-filtered-sequences ${artdir}/deblur-filtered.qza

echo "Quality filter completed (1/2)"
echo "Beginning 16S denoise..."

qiime deblur denoise-16S \
	--i-demultiplexed-seqs ${artdir}/deblur-filtered.qza \
	--o-representative-sequences ${PWD}/rep-seqs-deblur.qza \
	--o-stats ${PWD}/deblur-stats.qza \
	--o-table ${PWD}/table-deblur.qza \
	--output-dir ${PWD}/deblur-out \
	--p-sample-stats \
	--p-trim-length "${trim_length}" \	
	--p-jobs-to-start "${threads}" \
	--quiet

echo "Denoise completed (2/2 preproc)"
echo "Sequences trimmed at 250pb"

