# Prerequisites
```
*SureTypeSC (https://github.com/Meiomap/SureTypeSC_2) [python package]

*reticulate (https://rstudio.github.io/reticulate/) [r package]

*knitr(https://github.com/yihui/knitr) [r package]

*BiocStyle(https://bioconductor.org/packages/release/bioc/html/BiocStyle.html) [r package]
```

# Installation

After downloading and unpacking the package and rename the fold to be SureTypeSCR, run the command line below to install the R package SureTypeSCR

```

R CMD INSTALL SureTypeSCR_0.99.0.tar.gz
```

or the other way is possible (only if this repository is public)
```
devtools::install_github('Meiomap/SureTypeSCR', build_vignettes = TRUE)
```


# Introduction

A key motivation of SureTypeSCR is that accurate genotyping of DNA from a single cell is required for application such as de novo mutation detection and linkage analysis, but achieving high precision genotyping in the single cell environment is challenging due to the errors caused by whole genome amplification.

SureTypeSCR, based on python, is a two-stage machine learning algorithm that filters a substantial part of the noise, thereby retaining of the majority of
the high quality SNPs. SureTypeSCR consists of two layers, Random Forest (RF) and Gaussian Discriminant Analysis (GDA).



## Module references

The package includes a list of references to python
modules including numpy, pandas and SureTypeSC.

```{r loadup}
library(SureTypeSCR)
```



## Importing data for direct handling by python functions

The reticulate package is designed to limit the amount
of effort required to convert data from R to python
for natural use in each language. SureTypeSCR package includes test data. Users can play with the test data.




## To process the raw gtc files without genomesutdio, we can use scbasic.

```{r dota}
df <- scbasic(manifest_path,cluster_path,samplesheet)
```

## GTC data quality check
### call rate over all samples

```{r call}
df <- scbasic(manifest_path,cluster_path,samplesheet)

callrate_allsamples <- callrate(df,th=0.3)

callrate_onechr <- callrate_chr(df,'X', th=0.15)

geno_freq <- allele_freq(df,th=0.5)

```

### M ans A features calculation of chromosomes

```{r locus}
df <- scbasic(manifest_path,cluster_path,samplesheet)

am <- sample_ma(df,sample_name,'1')

```



### PCA

```{r PCA}

df <- scbasic(manifest_path,cluster_path,samplesheet)

pca_all <- pca_samples(df,th=0.1)

pca_onechr <- pca_chr(df,'X',th=0.1)
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

call <- sc_allele_freq(df,'score',0.2)

call_rate <- sc_callrate(df,'score',0.2)

call_rate_chr <- sc_callrate_chr(df,'score',0.2,'21')

call_chr_freq <- sc_chr_freq(df,'score',0.2,'21')


```

## To select certain chromosomes, apply the threshold on the Gencall score and calculate
m and a features (training data preparation)

```{r dotx}
dfs <- restrict_chrom(dfs,c('1','2'))
dfs <- apply_thresh(dfs,0.01)
dfs <- calculate_ma(dfs) 

```

# Train and Predict

## To load classifiers (rf: Random Forest; gda: gaussian discriminat analysis) and predict

```{r dorpart}
clf_rf <- scload(clf_rf_path)
clf_gda <- scload(clf_gda_path)

result_rf <- scpredict(clf_rf, dfs, clftype='rf')
result_rf$df (to monitor the data frame)
result_gda <- scpredict(clf_gda,result_rf,clftype='gda')
result_gda$df (to monitor the data frame)
```

## To train the cascade of Random Forest and Guassian Discriminant Analysis:

```{r dopt}
trainer <- scTrain(result_rf,clfname='gda')

result_end <- scpredict(trainer,result_gda,clftype='rf-gda') 
result_end$df (to monitor the data frame)

```


# Save the results

After prediction, we can save the results

```{r doincr}

scsave(result_end,'recall.txt',clftype='rf',threshold=0.15,all=FALSE)

recall mode: clftype = 'rf'; threshold = 0.15

standard mode: clftype = 'rf-gda';  threshold = 0.15

precision mode: clftype = 'rf-gda'; threshold = 0.75

```

```
The program enriches every sample in the input data by :

| Subcolumn name  | Meaning |
| ------------- | ------------- |
| rf_ratio:1_pred  | Random Forest prediction (binary)  |
| rf_ratio:1_prob  | Random Forest Score for the positive class |
| gda_ratio:1_prob | Gaussian Discriminant Analysis score for the positive class  | 
| gda_ratio:1_pred | Gaussian Disciminant Analysis prediction (binary) | 
| rf-gda_ratio:1_prob | combined 2-layer RF and GDA - probability score for the positive class | 
| rf-gda_ratio:1_pred | binary prediction of RF-GDA | 
```



# Conclusions

We need more applications and profiling.
