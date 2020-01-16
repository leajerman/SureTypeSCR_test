\name{sc_chr_freq}
\alias{sc_chr_freq}
\title{This function is to calculate the allele frequency over all the samples of one chromosome}
\usage{
sc_chr_freq(df,alg,threshold,chrr)
}
\arguments{
\item{df}{Data object}
\item{alg}{algorithm}
\item{threshold}{the threshold}
\item{chrr}{the name of chromosome}
}
\value{
The callrate values of all samples 
}

\description{
The callrate function is to calculate the allele frequency over all the samples of one chromosome
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


# create Data object and rearrange the index
df <- create_from_frame(df)

# The Random Forest classifier
call <- sc_chr_freq(df,'score',0.2,'21') 




}