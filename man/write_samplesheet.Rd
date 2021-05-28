\name{write_samplesheet}
\alias{write_samplesheet}
\title{Function creates samplesheet compatible with SureTypeSCR}
\usage{
write_samplesheet(filename,array_positions,gtc_output,manifest,experiment_name='Experiment1',project_name='Project1',investigator_name='Investigator1')
}

\arguments{
\item{filename}{name/path of the newly created sample sheet}
\item{array_positions}{data frame storing metadata about sample id, array id and position, following columns are required: \code{sampleid,arrayid,position}}
\item{gtc_output}{path where GTC files are stored}
\item{manifest}{name of the manifest file}
\item{experiment_name}{experiment name}
\item{project_name}{project name}
\item{investigator_name}{investigator name}
}
\value{writes external file to \code{filename}}


\description{Function is used in case data was converted from idat and sample sheet was not available with the data.}
%\description{
%
%}
\examples{
# library(GEOquery)

#gse <- getGEO("GSE19247",GSEMatrix = TRUE)
#manifest=system.file("files/HumanCytoSNP-12v2_H.bpm",package="SureTypeSCR")

#samplelist_sperm=as.data.frame(gse$`GSE19247-GPL6985_series_matrix.txt.gz`) %>% 
#  filter((str_detect(cell.type.ch1,'sperm')) & str_detect(cell.amplication.ch1,'MDA')) %>%
#  rownames()  

#metadf_sperm=map_if(samplelist_sperm,function(x) !is.null(x),function(x) getGEO_and_folder_in(x,download=TRUE))
#metadf_sperm_merged = Reduce(function(...) merge(..., all=T), metadf_sperm)



#SureTypeSCR::write_samplesheet('samplesheet.csv',metadf_sperm_merged,'GTC',manifest)
}
