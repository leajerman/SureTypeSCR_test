# SureTypeSCR

## Introduction

SureTypeSCR is an R package for QC and rapid genotyping of single cell SNP array data. It encapsulates previously developed library SureTypeSC (PMID: 31116387). The core consists of a two layered machine learning method that assigns a quality score to each SNP in an array. On top of that, SureTypeSCR implements various QC strategies to examine the data. SureTypeSCR is extensively using packages from the tidyverse collection thereby allowing to apply modern data science approach to query the data.

## Prerequisites
Provided installation scripts will install most of the dependencies automatically, however following is needed prior to the installation:
* R (>=4.0) 
* Python 3 (>= 3.6)

## Installation

As SureTypeSCR is using both Python libraries (via reticulate) and R. A preferred way is to first create a virtual python environment, install all necessarry python libraries and then install the R package. Provided installation scripts per platform (see below) will take you through this process.

### Windows
Download and unzip package_win.zip. In the unzipped directory, run following in the Windows command line: 
* `create_virtual_environment_win.bat`
* and then install the Python packages (including the core SureTypeSC package) using `install_packages_win.bat`.  This script should also give you path to the Python interpreter that you will be using in your R scripts. Please note this path.

### Linux
Run following commands in terminal:
* `source create_virtual_environment_linux.sh`
* and then install the Python packages (including the core SureTypeSC package) using `sh install_packages_linux.sh`.  This script should also give you path to the Python interpreter that you will be using in your R scripts. Please note this path.

### Mac
Run following commands in terminal:
* `source create_virtual_environment_mac.sh`
* and then install the Python packages (including the core SureTypeSC package) using `sh install_packages_mac.sh`.  This script should also give you path to the Python interpreter that you will be using in your R scripts. Please note this path.



### Installation of the SureTypeSCR R package
Download (from Google Drive) and installation of the actual package is part of the prologue script (see below) for now due to the file size limitations on GitHub


## Getting started
### Prologue
Provided prologue script installs package dependencies.

```R
#install dependencies
install.packages(c('googledrive','reticulate','knitr'))
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("BiocStyle")

```
In order correctly load the Python libraries via reticulate, R must know the location of the Python interpreter, therefore load reticulate first, then set the path to the python interpreter and then download, install and load SureTypeSCR:

```R

library(reticulate)
Sys.setenv(RETICULATE_PYTHON='YOUR_PYTHON_PATH') 

library(googledrive)
#download SureTypeSCR_0.99.0.tar.gz
drive_download(as_id('1gPcAddbXdCTO69Ro8D2z6lK26Ow84-h8'))
shell("R CMD INSTALL SureTypeSCR_0.99.0.tar.gz")
```

### Downloading data and classifier
In order to load the raw Illumina genotype data into data frame, following files are required:
* genotypes in GTC format
* manifest file that includes details about the SNP markers on the array
* cluster file 
* samplesheet that links the sample names to GTC paths 

The data and classifiers are stored in Google Drive due to space limitations on GitHub. Download and unzip them them using code below:

```R
#download classifier CLASSIFIERS.zip
drive_download(as_id('1wBPSMQiuY50Zct9Re2LkqaQgHwuu0k6k'))

#download testing data TESTING_DATA_2SAMPLES.zip
drive_download(as_id('1SUDvgEyynXuAmgECHVrzx6pPoJ5PnNy1'))

unzip('CLASSIFIERS.zip')
unzip('TESTING_DATA_2SAMPLES.zip')
```
The testing data and the classifiers should be now ready in the TESTING_DATA_2SAMPLES and CLASSIFIERS folder, respectively.

### Loading data
```R
setwd('TESTING_DATA_2SAMPLES')

df = scbasic_IV(samplesheet='Samplesheetr.csv',
                bpm='HumanKaryomap-12v1_A.bpm',
                egt='HumanKaryomap-12v1_A.egt')
```

The dataframe ```df``` should be now populated with genotype features from 2 samples.


