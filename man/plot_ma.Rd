\name{plot_ma}
\alias{plot_ma}
\title{Visualise MA plot per individual}
\usage{
plot_ma(.data,norm=TRUE,smooth=FALSE,nocalls=FALSE,n=1)
}
\arguments{
\item{.data}{data frame returned by \code{scbasic} or compatible function}
\item{norm}{boolean flag indicating whether to use normalized (\code{TRUE}) or raw (\code{FALSE}) intensities}
\item{smooth}{boolean flag indicating whether to apply smoothing spline per genotype cluster(AA/BB/AB), \code{TRUE}) or (\code{FALSE}}, set to \code{FALSE}) by default.
\item{nocalls}{boolean flag indicating whether to include nocalls in plotting (\code{TRUE}) or (\code{FALSE})}, set to \code{FALSE}) by default. 
\item{n}{fraction of data to use from \code{.data} (real number in range 0..1)}, set to 1 by default meaning all points will by plotted.
}
\value{
ggplot object with MA plots facetted by individual 
}

\description{
Plot dotplot of logarithmic difference (M) and logarithmic average (A) of intensity signals
}
%\description{
%
%}
\examples{

# parsing file from gtc raw files
setwd(system.file(package='SureTypeSCR'))

samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)

#Visualise MA plot
df %>% plot_ma(norm=TRUE,n=0.1)
}