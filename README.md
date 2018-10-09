# q2pipe

QIIME2 16S pipeline - WORK IN PROGRESS

Using QIIME2, runs a complete analysis from your data based on a range of optimizable parameters, such as trimming and truncate length, annotation identity, and cluster parameters.

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

---

## References

1. The very own [QIIME](http://qiime.org/) and [QIIME2](https://qiime2.org/)
2. DADA2 sequence denoise pipeline: Callahan, B. J., McMurdie, P. J., Rosen, M. J., Han, A. W., Johnson, A. J. A., & Holmes, S. P. (2016). DADA2: high-resolution sample inference from Illumina amplicon data. Nature methods, 13(7), 581.
3. VSEARCH for sequence clustering and feature classification: Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584.
4. BLAST also used for feature classification: Camacho, C., Coulouris, G., Avagyan, V., Ma, N., Papadopoulos, J., Bealer, K., & Madden, T. L. (2009). BLAST+: architecture and applications. BMC bioinformatics, 10(1), 421. 
5. PICRUSt for metagenome prediction: Langille, M. G., Zaneveld, J., Caporaso, J. G., McDonald, D., Knights, D., Reyes, J. A., ... & Beiko, R. G. (2013). Predictive functional profiling of microbial communities using 16S rRNA marker gene sequences. Nature biotechnology, 31(9), 814.

