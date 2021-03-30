## ----dsetup,echo=TRUE,results="hide",include=FALSE----------------------------
Sys.setenv(RETICULATE_PYTHON='C:\\Users\\gqc954\\AppData\\Local\\Programs\\Python\\Python39')
library(SureTypeSCR)
library(BiocStyle)
library(googledrive)
library(tidyverse)
library(magrittr)

## ----doimpe,results="hide",message=FALSE--------------------------------------
#download classifier CLASSIFIERS.zip
drive_download(as_id('1wBPSMQiuY50Zct9Re2LkqaQgHwuu0k6k'),overwrite=TRUE)

#download testing data TESTING_DATA_2SAMPLES.zip
drive_download(as_id('1SUDvgEyynXuAmgECHVrzx6pPoJ5PnNy1'),overwrite=TRUE)

unzip('CLASSIFIERS.zip')
unzip('TESTING_DATA_2SAMPLES.zip')

gtc_path = 'TESTING_DATA_2SAMPLES/GTCs'
cluster_path = 'TESTING_DATA_2SAMPLES/HumanKaryomap-12v1_A.egt'
manifest_path = 'TESTING_DATA_2SAMPLES/HumanKaryomap-12v1_A.bpm'
samplesheet_path = 'TESTING_DATA_2SAMPLES/Samplesheetr.csv'
clf_rf_path = 'CLASSIFIERS/clf_30trees_7228_ratio1_lightweight.clf'


## ----dota---------------------------------------------------------------------
df <- scbasic_IV(samplesheet=samplesheet_path,
                 bpm=manifest_path,
                 egt=cluster_path)

head(df)


## ----call---------------------------------------------------------------------
df %>% callrate_IV()

## ----threshold----------------------------------------------------------------
df %>% get_threshold()

## ----call2--------------------------------------------------------------------
df %>% 
  group_by(individual)  %>% 
  callrate_IV()


## ----call3--------------------------------------------------------------------

df %>% 
  group_by(individual,Chr,gtype) %>% 
  callrate_IV()

## ----call4--------------------------------------------------------------------
df %>% 
  group_by(individual,Chr,gtype) %>% 
  callrate_IV() %>% 
  pivot_wider(names_from=gtype,values_from=Callrate)


## ----call5--------------------------------------------------------------------
df %>% 
  set_threshold(clfcol = 'score',threshold = 0.5) %>% 
  group_by(individual) %>% 
  callrate_IV() 


## ----ma-----------------------------------------------------------------------
df %>% calculate_ma_IV() %>% head()
#head(df)

## ----plotma-------------------------------------------------------------------
#df %>% set_threshold(clfcol='score',threshold=0.5) %>% plot_ma()
ma_plot=df %>% plot_ma()
ma_plot



## ----PCA----------------------------------------------------------------------
pca_plot = df %>% plot_pca(feat=c('gtype'))
pca_plot

## ----clfload------------------------------------------------------------------
clf_rf= scload('CLASSIFIERS/clf_30trees_7228_ratio1_lightweight.clf')

## ----class--------------------------------------------------------------------
df %<>% predict_suretype(clf_rf)

## ----class_view---------------------------------------------------------------
df %>% filter(Chr==1) %>% head()

