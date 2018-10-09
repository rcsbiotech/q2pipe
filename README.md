# q2pipe

QIIME2 16S pipeline - WORK IN PROGRESS

From QIIME2, runs a complete analysis from your data based on a range of optimizable parameters, such as trimming and truncate length, annotation identity, and cluster parameters.

Requires:

- [Conda package manager](https://conda.io/docs/user-guide/install/index.html);
- [QIIME1 installed via conda](http://qiime.org/install/install.html), will be removed soon;
- [QIIME2 installed via conda](https://docs.qiime2.org/2018.8/install/);
- [BIOM format](http://biom-format.org/)

## Current schema

![Q2pipe-schema-09-10](https://drive.google.com/a/unesp.br/uc?id=159mfxaU5tcffqKr9z9j37gCIDij2_-og)

## Currently in development

DADA2 iterative pre-processing over a range of parameters

## To be implemented

1. Annotation with VSEARCH/BLAST over SILVA132 and the latest Greengenes
2. Core diversity analysis with QIIME2 (OK)
3. Merge-Denoise-Deblur optimized pipeline
4. Automatic q2-feature-classifier
5. Generate numerical ecology analysis based on metadata columns

