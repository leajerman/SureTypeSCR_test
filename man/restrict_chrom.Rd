\name{restrict_chrom}
\alias{restrict_chrom}
\title{To choose certain chromosomes with Data object}
\usage{
restrict_chrom(df,chrom)
}
\arguments{
\item{df}{the Data object from create_from_frame function}
\item{chrom}{the list of selected chromosomes}
}
\value{
Data object only with certain chromosomes
}

\description{
To choose certain chromosomes with Data object
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

df <- create_from_frame(df)

df <- restrict_chrom(df,c('1','2'))




}