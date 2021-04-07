\name{scbasic}
\alias{scbasic}
\title{Load data in GTC format into data frame}
\usage{
scbasic(bpm,egt,samplesheet)
}
\arguments{

\item{bpm}{a pathname to a manifest file}

\item{egt}{a pathname to a cluster file}

\item{samplesheet}{pathname to samplesheet}

}
\value{
data frame stacked by individual 
}
\description{
Function calls functions from Illumina BeadArray library to load data from GTC files into dataframe using manifest and cluster file. 
}
\examples{

setwd(system.file(package='SureTypeSCR'))

gtc_path=system.file('files/GTCs',package='SureTypeSCR')
samplesheet=system.file('files/GSE19247_embryos.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)

}
