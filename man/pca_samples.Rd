\name{pca_samples}
\alias{pca_samples}
\title{To apply principle component annalysis on frequency dataframe of samples}
\usage{
pca_samples(df,th=0)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
\item{th}{the threshold}
}
\value{
Component values
}

\description{
To apply principle component annalysis on frequency dataframe of samples
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
call <- pca_samples(df,th=0.2) 




}