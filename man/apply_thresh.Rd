\name{apply_thresh}
\alias{apply_thresh}
\title{To apply threshold over all samples on GenCall score}
\usage{
apply_thresh(df,th)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
\item{th}{the threshold}
}
\value{
Data object only with applied threshold
}

\description{
To apply threshold over all samples on GenCall score
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

df <- apply_thresh(df,0.01)




}