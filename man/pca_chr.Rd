\name{pca_chr}
\alias{pca_chr}
\title{To apply principle component annalysis on frequency dataframe of samples of one chromosome}
\usage{
pca_chr(df,chr_name,th=0,n=2)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
\item{chr_name}{the name of the specific chromosome}
\item{th}{the threshold}
\item{n}{n is the number of components}
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
call <- pca_chr(df,'X') 




}