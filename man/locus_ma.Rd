\name{locus_ma}
\alias{locus_ma}
\title{To do m and a aggregation at a specific locus}
\usage{
locus_ma(df,locus)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
\item{locus}{the name of the locus}
}
\value{
the m and a of one locus
}

\description{
To do m and a aggregation at a specific locus
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
call <- locus_ma(df,'rs3128117') 




}