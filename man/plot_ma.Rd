\name{plot_ma}
\alias{plot_ma}
\title{Visualise MA plot per individual}
\usage{
plot_ma(.data,norm=TRUE,smooth=FALSE,nocalls=FALSE,n=1)
}
\arguments{
\item{.data}{data frame returned by scbasic or compatible function}
\item{norm}{flag indicating whether to use normalized (\code{TRUE}) or raw (\code{FALSE}) intensities}
\item{smooth}{flag indicating whether to apply smoothing spline per genotype cluster(AA/BB/AB)}
\item{nocalls}{flag indicating whether to include nocalls in plotting}
\item{n}{fraction of data to use from \code{.data}}
}
\value{
ggplot object with MA plots facetted by individual 
}

\description{
Plot dotplot of logarithmic difference (M) and logarithmic average (A) of itensity signals
}
%\description{
%
%}
\examples{

# parsing file from gtc raw files
setwd(system.file(package='SureTypeSCR'))

samplesheet=system.file('files/GSE19247_embryos.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')
clf=system.file('files/rf.clf',package='SureTypeSCR')


#Load data
df=scbasic(manifest,cluster,samplesheet)

#Visualise MA plot
df %>% plot_ma(norm=TRUE,n=0.1)
}