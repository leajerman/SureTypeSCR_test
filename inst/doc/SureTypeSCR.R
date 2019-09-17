## ----dsetup,echo=FALSE,results="hide",include=FALSE------------------------
suppressPackageStartupMessages({
library(SureTypeSCR)
library(BiocStyle)
})

## ----loadup----------------------------------------------------------------
library(SureTypeSCR)
scall = scEls()

## ----doimp-----------------------------------------------------------------
gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')
clf_rf_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
clf_gda_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')

## ----dota------------------------------------------------------------------
df <- scbasic(gtc_path,manifest_path,cluster_path,samplesheet,'\t')


## ----dotinde---------------------------------------------------------------
dfs <- create_from_frame(df)

values <- dfs$df

values$shape

values$columns

values$dtypes

values['sc21']['score'][900:1200]



## ----dotx------------------------------------------------------------------
dfs$restrict_chromosomes(c('1','2'))
dfs$apply_NC_threshold_3(0.01)
dfs$calculate_transformations_2() 


## ----dorpart---------------------------------------------------------------
clf_rf <- scload(clf_rf_path)
clf_gda <- scload(clf_gda_path)

result_rf <- clf_rf$predict_decorate(dfs, clftype='rf')
result_gda <- clf_gda$predict_decorate(result_rf,clftype='gda')


## ----dopt------------------------------------------------------------------
trainer <- scTrain(result_rf,clfname='gda')

result_end <- trainer$predict_decorate(result_gda,clftype='rf-gda') 


## ----doincr----------------------------------------------------------------
result_end$save_complete_table('fulltable.txt',header=TRUE)

result_end$save_mode('recall','recall.txt',header=FALSE) 

result_end$save_mode('precision','precision.txt',header=FALSE) 

result_end$save_mode('standard','standard.txt',header=FALSE) 

