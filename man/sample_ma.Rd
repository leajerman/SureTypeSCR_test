\name{sample_ma}
\alias{sample_ma}
\title{To do m and a aggregation at a specific chromosome of a specific sample}
\usage{
sample_ma(df,sample_name,chr_name)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
\item{sample_name}{the name of the sample}
\item{chr_name}{the name of the chromosome}
}
\value{
the m and a a of specific chromosome of a specific sample
}

\description{
To do m and a at a specific chromosome of a specific sample
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
call <- sample_ma(df,'Kit4_4mos_SC21','1') 



}