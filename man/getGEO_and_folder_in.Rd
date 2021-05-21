\name{getGEO_and_folder_in}
\alias{getGEO_and_folder_in}
\title{Download item from the GEO database}
\usage{
getGEO_and_folder_in(x,download=FALSE)
}
\arguments{
\item{x}{GEO record ID}
\item{download}{boolean flag indicating whether to download the data (\code{TRUE}) or just the metadata (\code{FALSE})

}
\value{
Data frame with metadata
}
\description{
Downloads metadata (and data) for GEO records specified in \code{x}.
}
\examples{
library(GEOquery)

gse <- getGEO("GSE19247",GSEMatrix = TRUE)

samplelist_sperm=as.data.frame(gse$`GSE19247-GPL6985_series_matrix.txt.gz`) %>% 
  filter((str_detect(cell.type.ch1,'sperm')) & str_detect(cell.amplication.ch1,'MDA')) %>%
  rownames()  

metadf_sperm=map_if(samplelist_sperm,function(x) !is.null(x),function(x) getGEO_and_folder_in(x,download=TRUE))
metadf_sperm_merged = Reduce(function(...) merge(..., all=T), metadf_sperm)
}
