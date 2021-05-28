\name{scbasic}
\alias{scbasic}
\title{Load data in GTC format into data frame}
\usage{
scbasic(bpm,egt,samplesheet)
}
\arguments{
\item{bpm}{pathname to manifest file}
\item{egt}{pathname to cluster file}
\item{samplesheet}{pathname to samplesheet}
}
\value{
data frame stacked by individual 
}
\description{
Function instantiates Illumina BeadArray library to load data from GTC files into data frame using information from manifest and cluster file. 
}
\examples{
setwd(system.file(package='SureTypeSCR'))
samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)
}
