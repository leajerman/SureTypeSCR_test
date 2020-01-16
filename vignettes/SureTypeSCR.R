## ----dsetup,echo=FALSE,results="hide",include=FALSE------------------------
suppressPackageStartupMessages({
library(SureTypeSCR)
library(BiocStyle)
})

## ----loadup----------------------------------------------------------------
library(SureTypeSCR)
scEls()

## ----doimp-----------------------------------------------------------------
gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')
clf_rf_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
clf_gda_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')

## ----dota------------------------------------------------------------------
df <- scbasic(manifest_path,cluster_path,samplesheet)

## ----call------------------------------------------------------------------

df <- scbasic(manifest_path,cluster_path,samplesheet)

callrate_allsamples <- callrate(df,th=0.3)

callrate_onechr <- callrate_chr(df,'X', th=0.15)

geno_freq <- allele_freq(df,th=0.01)

## ----locus------------------------------------------------------------------

df <- scbasic(manifest_path,cluster_path,samplesheet,'\t')

locus <- locus_ma(df,'rs3128117')

am <- sample_ma(df,'Kit4_4mos_SC21','21')



## ----PCA------------------------------------------------------------------

df <- scbasic(manifest_path,cluster_path,samplesheet,'\t')

pca_all <- pca_samples(df,th=0.1)

pca_onechr <- pca_chr(df,'X',th=0.1)


## ----dotinde---------------------------------------------------------------
dfs <- create_from_frame(df)

values <- dfs$df

values$shape

values$columns

values$dtypes

values['sc21']['score'][900:1200]



## ----dotx------------------------------------------------------------------
dfs <- restrict_chrom(dfs,c('1','2'))
dfs <- apply_thresh(dfs,0.01)
dfs <- calculate_ma(dfs) 


## ----dorpart---------------------------------------------------------------
clf_rf <- scload(clf_rf_path)
clf_gda <- scload(clf_gda_path)

result_rf <- scpredict(clf_rf,dfs, clftype='rf')
result_gda <- scpredict(clf_gda,result_rf,clftype='gda')


## ----dopt------------------------------------------------------------------
trainer <- scTrain(result_rf,clfname='gda')

result_end <- scpredict(trainer,result_gda,clftype='rf-gda') 


call <- sc_callrate(result_end,'rf-gda',0.1)
call_1 <- sc_callrate_chr(result_end,'rf-gda',0.1,'1')

freq <- sc_allele_freq(result_end,'rf-gda',0.1)
freq_1 <- sc_chr_freq(result_end,'rf-gda',0.1,'1')

## ----doincr----------------------------------------------------------------
#result_end$save_complete_table('fulltable.txt',header=TRUE)

#result_end$save_mode('recall','recall.txt',header=FALSE) 

#result_end$save_mode('precision','precision.txt',header=FALSE) 

#result_end$save_mode('standard','standard.txt',header=FALSE) 

#scsave(result_end,'full.txt',all=TRUE)

scsave(result_end,'recall.txt',clftype='rf',threshold=0.15,all=FALSE)


