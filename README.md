# q2pipe

QIIME2 16S pipeline - WORK IN PROGRESS
Implemented for QIIME2 2018.8

Using QIIME2, runs a complete analysis from your data based on a range of optimizable parameters, such as trimming and truncate length, annotation identity, and cluster parameters.

### What you must install before running:

- [Conda package manager](https://conda.io/docs/user-guide/install/index.html) package manager that installs QIIME2 easily;
- [QIIME2 installed via conda](https://docs.qiime2.org/2018.8/install/), the main analysis package;
- [BIOM format](http://biom-format.org/) for data wrangling;
- [PICRUSt](http://picrust.github.io/picrust/install.html#install) metagenome predictor;

### What you must feed the pipeline

- Analysis parameters, such as name, trimming and truncation values, max. expected errors, which algorithm to use for annotation, and such.
- [A manifest text file for data](https://docs.qiime2.org/2018.8/tutorials/importing/?highlight=manifest#fastq-manifest-formats);
- [A sample metadata text file](https://docs.qiime2.org/2018.8/tutorials/moving-pictures/?highlight=metadata#sample-metadata);
- Your paired-end sequences.

### What does the pipeline do

1. Imports your data as a QIIME2 artifact;
2. Denoise it using the DADA2 pipeline;
3. Classifies your data using either BLAST or VSEARCH, against the latest Greengenes and SILVA database;
4. Run core diversity and basic phylogenetic analysis based on QIIME2
5. Predict the metagenomes with PICRUSt;
6. Reports all results as HTML, plain text and a usable BIOM-taxonomy file.
7. (WIP) Run our custom RScript pipeline with the main diversity indexes.

### Suggested workflow (WIP)

1. Turn on your qiime2 (usually with `source activate qiime2-2018.8`)
2. Create a manifest file, with the name manifest.csv, then put it inside the intel directory.
3. Run q2manifest to import your data as a QIIME2 artifact.
4. Open the demux-summary.html in a web browser, and pick parameters suitable to your sequences.
5. Write these parameters on intel/parameters.sh.
6. Run q2pipe and then q2picrust. That's it. Your results will be found at the test directory.

### Current schema

![Q2pipe-schema-11-12](https://drive.google.com/a/unesp.br/uc?id=1_J7u4ZNDPtEtyqCU_YjHuONbVu0JnkdK)

## Currently in development

- DADA2 iterative pre-processing over a range of parameters
- RScript to run all analysis without having to input in another platform

## To be implemented

1. Annotation with VSEARCH/BLAST over SILVA132 and the latest Greengenes
2. Core diversity analysis with QIIME2 (OK)
3. Merge-Denoise-Deblur optimized pipeline
4. Automatic q2-feature-classifier
5. Generate numerical ecology analysis based on metadata columns

---

## References

1. The very own [QIIME](http://qiime.org/) and [QIIME2](https://qiime2.org/).
2. DADA2 sequence denoise pipeline: Callahan, B. J., McMurdie, P. J., Rosen, M. J., Han, A. W., Johnson, A. J. A., & Holmes, S. P. (2016). DADA2: high-resolution sample inference from Illumina amplicon data. Nature methods, 13(7), 581.
3. VSEARCH for sequence clustering and feature classification: Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584.
4. BLAST also used for feature classification: Camacho, C., Coulouris, G., Avagyan, V., Ma, N., Papadopoulos, J., Bealer, K., & Madden, T. L. (2009). BLAST+: architecture and applications. BMC bioinformatics, 10(1), 421. 
5. PICRUSt for metagenome prediction: Langille, M. G., Zaneveld, J., Caporaso, J. G., McDonald, D., Knights, D., Reyes, J. A., ... & Beiko, R. G. (2013). Predictive functional profiling of microbial communities using 16S rRNA marker gene sequences. Nature biotechnology, 31(9), 814.

