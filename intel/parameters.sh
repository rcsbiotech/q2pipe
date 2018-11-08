# QIIME2 pipeline variables

# Variable declaration

# Directory to store analysis outputs
testdir="./test/test01A"
testname=`basename ./test/test38B | sed 's/test//'`

# Directory to store qiime2 artifacts
artdir="./artifacts"

# Relative path to intel directory
inteldir="./intel"

# Pre-processing

## Pre-process the data with DADA?
preproc="no"
## If yes, annotate after preprocessing?
annotate_after="no"

# If yes, pass the preprocessing parameters
trunc_f=280
trunc_r=220
trim_f=10
trim_r=10
max_ee=6


# Diretório para a identidade da anotação
parameter_identity=0.97
# Diretório com o número de processadores
parameter_threads=15
# Opções de anotador: vsearch | blast
annotator="vsearch"
# Diretório para as sequências clusterizadas"
seqsdir="${testdir}/clusterized"
# Cluster de novo?                              ( yes | no )
denovo="no"
# Cluster identity
parameter_cluster_id=0.99
# Reference sequences (qza) - current: Silva 0.99 full length
# SILVA 128: ref_seqs="/work/db/qiime/SILVA_128_QIIME_release/artifacts/silva128_99.qza"
# SILVA 132: 
ref_seqs="/data/db/qiime/SILVA_132_QIIME_release/QIIME2-artifacts/silva132_99.qza"
# GDP: ref_seqs="/data/db/qiime/GRD/artifacts/GRD_sequences.qza"
# Reference taxonomy - current: Silva 0.99 full lenght tax
# SILVA 128: ref_tax="/work/db/qiime/SILVA_128_QIIME_release/artifacts/silva128_99_taxonomy.qza"
# SILVA 132: 
ref_tax="/data/db/qiime/SILVA_132_QIIME_release/QIIME2-artifacts/silva132_99_taxonomy.qza"
# GDP: ref_tax="/data/db/qiime/GRD/artifacts/GRD_taxonomy.qza"
# Arquivo de sequências representativas e tabela
rep_seqs="${testname}-rep-seqs-dada2.qza"
table_seqs="${testname}-table-dada2.qza"
# Correr a diversidade?
run_diversity="yes"
# Gerar com cloroplasto e mitocondrias?
run_corrupt="no"

# Cria a variável "Nome da análise"
testname=`echo ${testdir} | sed 's/\.\/test\///'`

## Fim da declaração de variáveis

