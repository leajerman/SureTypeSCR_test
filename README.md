# SureTypeSCR

## Introduction

SureTypeSCR is an R package for QC and rapid genotyping of single cell SNP array data. It encapsulates previously developed library SureTypeSC ([paper](https://academic.oup.com/bioinformatics/article/35/23/5055/5497252)). The core consists of a two layered machine learning method that assigns a quality score to each SNP in an array. On top of that, SureTypeSCR implements various QC strategies to examine the data using packages from the tidyverse collection.

## Prerequisites
The following is needed prior to the installation:
* R (>=4.0). 
* Python 3 (>= 3.6)
* [devtools](https://www.google.com)

## Installation

```R
install.packages('devtools')
library('devtools')
##install  SureTypeSCR  from  github
devtools::install_github("Meiomap/SureTypeSCR")
```

## Initialization and data
When loaded for the first time, SureTypeSCR will create a python virtual environment and install all required python libraries via python package installer (pip). A sample data and metadata deployed with the package can be used for testing whether the pakcage was installed and loaded correctly.

```R
library(SureTypeSCR)

setwd(system.file(package='SureTypeSCR'))
samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)
```



## Documentation

For tutorial vignette and reference manual, please refer to doc/ and doc/, respectively. An inline help for a particular function can be invoked withing the code by typing ?function_name


## Further information

In case you are seeking for additional information or have problems installing or using the software, please write to ivogel[at]sund.ku.dk or report an issue in the Issues tracker.
