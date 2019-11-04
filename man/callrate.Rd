\name{callrate}
\alias{callrate}
\title{The callrate function is to calculate the allele frequency over all the samples}
\usage{
callrate(df,th=0)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
\item{th}{the threshold}
}
\value{
The callrate values of all samples
}

\description{
The callrate function is to calculate the allele frequency over all the samples
}
%\description{
%
%}
\examples{

# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- callrate(df,th=0.2) 




}