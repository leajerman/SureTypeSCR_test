---
title: "SureTypeSCR -- Implementation of algorithm for regenotyping of single cell data."
author: "Ivan Vogel, Lishan Cai"
date: "February 19, 2021"
vignette: >
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteIndexEntry{SureTypeSCR overview}
  %\VignetteEncoding{UTF-8}
output:
  BiocStyle::html_document:
    highlight: pygments
    number_sections: yes
    theme: united
    toc: yes
---

# Introduction

A key motivation of SureTypeSCR is that accurate genotyping of DNA from a single cell is required for application such as de novo mutation detection and linkage analysis, but achieving high precision genotyping in the single cell environment is challenging due to the errors caused by whole genome amplification. 

SureTypeSCR, based on python, is a two-stage machine learning algorithm that filters a substantial part of the noise, thereby retaining of the majority of
the high quality SNPs. SureTypeSCR consists of two layers, Random Forest (RF) and Gaussian Discriminant Analysis (GDA).

This package also includes quality check (call rate, principle component analysis etc.)

# Basic concepts
## Loading dependencies
Make sure to replace the path in `Sys.setenv` to your python interpreter path (command `which python` on Linux/Mac or `where python` on Windows will give you the path)


## Downloading testing data and classifiers


```r
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
```

## Loading the raw genotypes into data frame


























