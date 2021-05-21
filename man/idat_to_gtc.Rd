\name{idat_to_gtc}
\alias{idat_to_gtc}
\title{Convert idat to gtc using IAAP cli}
\usage{
create_from_frame(df)
}
\arguments{
\item{idat_inputfolder}{input folder with stored idat files}
\item{gtc_output}{output folder for the GTC files}
\item{manifest}{path to manifest file}
\item{cluster}{path to cluster file}
idat_inputfolder,gtc_output,manifest,cluster


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
                          