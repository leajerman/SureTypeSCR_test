\name{create_from_frame}
\alias{create_from_frame}
\title{convert pandas dataframe to Data object}
\usage{
create_from_frame(df)
}
\arguments{
\item{df}{genotyping pandas dataframe from scbasic function}

}
\value{
Data object with index rearrangement (multi-leve index)

}
\description{
Convert pandas dataframe to Data object and rearrange the index level
}
\examples{

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

# get genotyping data from gtc files and meta file
df <- scbasic(manifest_path,cluster_path,samplesheet,'\t')


# create Data object and rearrange the index
dfs <- create_from_frame(df)


}
