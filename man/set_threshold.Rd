\name{set_threshold}
\alias{set_threshold}
\title{Set threshold on a classification method.}
\usage{
set_threshold(.data,clfcol,threshold)
}
\arguments{
\item{.data}{dataframe from \code{scbasic} or compatible}
\item{clfcol}{column with classification score}
\item{threshold}{threshold from 0 to 1}
}
\value{
data frame with gtype set to NC for classification score below chosen threshold
}

\description{
Function truncates the genotypes (column \code{gtype}) given a threshold (cutoff) an classification method. This causes that all genotypes below threshold defined in \code{threshol} will be called as NC (no-call)  
}
%\description{
%
%}
\examples{
setwd(system.file(package='SureTypeSCR'))
samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)
# changing Gencall score threshold 
df %>% set_threshold(clfcol='score',threshold=0.5) %>% callrate()
# with higher threshold we expect lower call rate
df %>% set_threshold(clfcol='score',threshold=0.75) %>% callrate()
}