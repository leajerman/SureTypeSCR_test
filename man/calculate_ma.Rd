\name{calculate_ma}
\alias{calculate_ma}
\title{To calculate m and a features}
\usage{
calculate_ma(df)
}
\arguments{
\item{df}{the pandas dataframe from GenomeStudio or scbasic function}
}
\value{
Data object with adding m and a features
}

\description{
To calculate m and a features
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

dfs <- calculate_ma(df)




}