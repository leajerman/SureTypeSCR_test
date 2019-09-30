# Introduction

A key motivation of SureTypeSCR is that accurate genotyping of DNA from a single cell is required for application such as de novo mutation detection and linkage analysis, but achieving high precision genotyping in the single cell environment is challenging due to the errors caused by whole genome amplification.

SureTypeSCR, based on python, is a two-stage machine learning algorithm that filters a substantial part of the noise, thereby retaining of the majority of
the high quality SNPs. SureTypeSCR consists of two layers, Random Forest (RF) and Gaussian Discriminant Analysis (GDA).

# Basic concepts

```{r dsetup,echo=FALSE,results="hide",include=FALSE}
suppressPackageStartupMessages({
library(SureTypeSCR)
library(BiocStyle)
})
```

## Module references

The package includes a list of references to python
modules including numpy, pandas and SureTypeSCR.

```{r loadup}
library(SureTypeSCR)
scall = scEls()
```



## Importing data for direct handling by python functions

The reticulate package is designed to limit the amount
of effort required to convert data from R to python
for natural use in each language. SureTypeSCR package includes test data.

```{r doimp}
gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')
clf_rf_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
clf_gda_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
```

## To process the raw gtc files without genomesutdio, we can use scbasic.

```{r dota}
df <- scbasic(gtc_path,manifest_path,cluster_path,samplesheet,'\t')

```

## To convert pandas dataframe to Data object and rearrange the index to multi-index level,
we use create_from_frame. And users can check the valuse by specifiy the 'df' attribution.
```{r dotinde}
dfs <- create_from_frame(df)

values <- dfs$df

values$shape

values$columns

values$dtypes

values['sc21']['score'][900:1200]


```

## To select certain chromosomes, apply the threshold on the Gencall score and calculate
m and a features (training data preparation)

```{r dotx}
dfs$restrict_chromosomes(c('1','2'))
dfs$apply_NC_threshold_3(0.01)
dfs$calculate_transformations_2() 

```

# Train and Predict

## To load classifiers (rf: Random Forest; gda: gaussian discriminat analysis) and predict

```{r dorpart}
clf_rf <- scload(clf_rf_path)
clf_gda <- scload(clf_gda_path)

result_rf <- clf_rf$predict_decorate(dfs, clftype='rf')
result_gda <- clf_gda$predict_decorate(result_rf,clftype='gda')

```

## To train the cascade of Random Forest and Guassian Discriminant Analysis:

```{r dopt}
trainer <- scTrain(result_rf,clfname='gda')

result_end <- trainer$predict_decorate(result_gda,clftype='rf-gda') 

```


# Save the results

After prediction, we can save the results
```{r doincr}
result_end$save_complete_table('fulltable.txt',header=TRUE)

result_end$save_mode('recall','recall.txt',header=FALSE) 

result_end$save_mode('precision','precision.txt',header=FALSE) 

result_end$save_mode('standard','standard.txt',header=FALSE) 
```





# Conclusions

We need more applications and profiling.
