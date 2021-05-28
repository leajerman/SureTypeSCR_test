\name{idat_to_gtc}
\alias{idat_to_gtc}
\title{Convert raw itensity IDAT files to GTC using IAAP-cli}
\usage{
idat_to_gtc(idat_inputfolder,gtc_output,manifest,cluster)
}
\arguments{
\item{idat_inputfolder}{input folder with stored idat files}
\item{gtc_output}{output folder for the GTC files}
\item{manifest}{path to manifest file}
\item{cluster}{path to cluster file}
}
\value{
}
\description{
The raw itensity data (red and green channel) are processed into GTC using Illumina's IAAP-cli. Function runs \code{configure_iaap()} before instantiating IAAP-cli to make sure IAAP-cli is properly configured. 
}
\examples{
#library(GEOquery)
#gse <- getGEO("GSE19247",GSEMatrix = TRUE)

#samplelist_sperm=as.data.frame(gse$`GSE19247-GPL6985_series_matrix.txt.gz`) %>% 
#  filter((str_detect(cell.type.ch1,'sperm')) & str_detect(cell.amplication.ch1,'MDA')) %>%
#  rownames()  

#metadf_sperm=map_if(samplelist_sperm,function(x) !is.null(x),function(x) SureTypeSCR::getGEO_and_folder_in(x,download=TRUE))
#metadf_sperm_merged = Reduce(function(...) merge(..., all=T), metadf_sperm)

#manifest=system.file("files/HumanCytoSNP-12v2_H.bpm",package="SureTypeSCR")
#cluster=system.file("files/HumanCytoSNP-12v2_H.egt",package="SureTypeSCR")

#for (ar in unique(metadf_sperm_merged$arrayid))
#{
#  idat_to_gtc(ar,'GTC',manifest,cluster)
#}

}
