# Warning

I've stopped using QIIME2 entirely, so be warned if anything below doesn't work for newer (2019/06) QIIME2 versions.

# q2pipe

QIIME2 16S wrapper
Implemented for QIIME2 2018.8

Runs a complete OTU analysis on your sequence data based on a range of optimizable parameters, such as trimming and truncate length, annotation identity, and cluster parameters.

This is a side project on my Masters Degree, and i will be implementing features and user-friendliness as i go.
Any questions or suggestions, you can easily reach me on the e-mail rc.silva@unesp.br, with the subject "q2pipe: your subject"

### What you must install before running:

- [Conda package manager](https://conda.io/docs/user-guide/install/index.html) package manager that installs QIIME2 easily;
- [QIIME2 installed via conda](https://docs.qiime2.org/2018.8/install/), the main analysis package;
- [BIOM format](http://biom-format.org/) for data wrangling;
- [PICRUSt](http://picrust.github.io/picrust/install.html#install) metagenome predictor;

### What you must feed the program

- Analysis parameters, such as name, trimming and truncation values, max. expected errors, which algorithm to use for annotation, and such.
- [A manifest text file for data](https://docs.qiime2.org/2018.8/tutorials/importing/?highlight=manifest#fastq-manifest-formats);
- [A sample metadata text file](https://docs.qiime2.org/2018.8/tutorials/moving-pictures/?highlight=metadata#sample-metadata);
- Your paired-end sequences.

### What does the wrapper do

1. Imports your data as a QIIME2 artifact;
2. Denoise it using the DADA2 pipeline;
3. Classifies your data using either BLAST or VSEARCH, against the latest Greengenes and SILVA database;
4. Run core diversity and basic phylogenetic analysis based on QIIME2
5. Predict the metagenomes with PICRUSt;
6. Reports all results as HTML, plain text and a usable BIOM-taxonomy file.
7. (WIP) Run our custom RScript with the main diversity indexes.

### Suggested workflow

1. Turn on your qiime2 (usually with `source activate qiime2-2018.8`)
2. Create a manifest file, with the name manifest.csv, then put it inside the intel directory.
3. Run q2manifest to import your data as a QIIME2 artifact.
4. Open the demux-summary.html in a web browser, and pick parameters suitable to your sequences.
5. Write these parameters on intel/parameters.txt
6. Run q2pipe and then q2picrust. 

And that's it.

### Current schema

![Q2pipe-schema-11-12](https://drive.google.com/a/unesp.br/uc?id=1_J7u4ZNDPtEtyqCU_YjHuONbVu0JnkdK)

## Currently in development

- Add user friendly description and help messages
- Error control for core wrapper (manifest, preproc, pipe and picrust)
	- Missing parameters;
	- Missing files;
	- Missing databases;

## Roadmap before alpha

1. (done) Annotation with VSEARCH/BLAST over SILVA132 and the latest Greengenes.
2. (done) Core diversity analysis with QIIME2.
3. (WIP) Update to QIIME-2011-11.
4. Implement shi7 to test over parameters.
5. Merge-Denoise-Deblur optimized preprocess pipeline.
6. Automatic q2-feature-classifier.
7. Generate numerical ecology analysis based on metadata columns, on a custom RScript.
8. Implement for ITS regions.

---

## References

1. [QIIME2](https://qiime2.org/).
2. I can't thank enough Edgar at Drive5 (https://drive5.com/about.html) for many, many insights over the years. 
3. DADA2 sequence denoise pipeline: Callahan, B. J., McMurdie, P. J., Rosen, M. J., Han, A. W., Johnson, A. J. A., & Holmes, S. P. (2016). DADA2: high-resolution sample inference from Illumina amplicon data. Nature methods, 13(7), 581.
4. VSEARCH for sequence clustering and feature classification: Rognes, T., Flouri, T., Nichols, B., Quince, C., & Mahé, F. (2016). VSEARCH: a versatile open source tool for metagenomics. PeerJ, 4, e2584.
5. BLAST also used for feature classification: Camacho, C., Coulouris, G., Avagyan, V., Ma, N., Papadopoulos, J., Bealer, K., & Madden, T. L. (2009). BLAST+: architecture and applications. BMC bioinformatics, 10(1), 421. 
6. PICRUSt for metagenome prediction: Langille, M. G., Zaneveld, J., Caporaso, J. G., McDonald, D., Knights, D., Reyes, J. A., ... & Beiko, R. G. (2013). Predictive functional profiling of microbial communities using 16S rRNA marker gene sequences. Nature biotechnology, 31(9), 814.

