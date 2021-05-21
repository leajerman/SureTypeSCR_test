\name{getGEO_and_folder_in}
\alias{getGEO_and_folder_in}
\title{Download item from the GEO database}
\usage{
getGEO_and_folder_in(x,download=FALSE)
}
\arguments{
\item{x}{genotyping pandas dataframe from scbasic function}
\item{download}{boolean flag indicating whether to download the data (\code{TRUE}) or just the metadata (\code{FALSE})

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
df <- scbasic(manifest_path,cluster_path,samplesheet)


# create Data object and rearrange the index
df <- create_from_frame(df)


}
