\name{scbasic}
\alias{scbasic}
\title{Function to process raw gtc data and meta data without genomestudio}
\usage{
scbasic(gtc_path, manifest_path, cluster_path, samplesheet_path, delimiter)
}
\arguments{
\item{gtc_path}{a pathname to gtc folder}

\item{manifest_path}{a pathname to manifest file}

\item{cluster_path}{a pathname to cluster file}

\item{samplesheet_path}{a pathname to samplesheet file}

\item{delimiter}{ tab is the most common used}
}
\value{
pandas data frame of genotyping data 
}
\description{
Function to process raw gtc data and meta data without genomestudio
}
\examples{
gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

# get genotyping data from gtc files and meta file
df <- scbasic(gtc_path,manifest_path,cluster_path,samplesheet,'\t')

#/Users/apple/anaconda3/envs/gtc2/lib/python2.7/site-packages/sklearn/ensemble/weight_boosting.py:29: 
#DeprecationWarning: numpy.core.umath_tests is an internal NumPy module and should not be imported. 
#It will be removed in a future NumPy release.
  #from numpy.core.umath_tests import inner1d
#Reading cluster file
#Reading sample file
#Number of samples: 2
#Reading manifest file
#Initializing genotype data
#Generating
#9968648019_R06C01
#9968648019_R06C02
#Finish parsing



}
