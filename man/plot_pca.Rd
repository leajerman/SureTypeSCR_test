\name{plot_pca}
\alias{plot_pca}
\title{Run and visualise PCA}
\usage{
plot_pca(.data,by_chrom,features,labels)
}
\arguments{
\item{.data}{dataframe of scbasic or compatible}
\item{by_chrom}{flag indicating whether to run PCA by chromosome}
\item{features}{vector of features types to use for PCA}
\item{labels}{flag indicating whether to show feature importance for 2D PCA}
}
\value{
ggplot object with PCA plot
}

\description{
Function creates feature matrix from non-zero SNPs and  feature types indicated in \code{features}  
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


#Load data
df=scbasic(manifest,cluster,samplesheet)

#create ggplot object with PCA
df %>% plot_pca(by_chrom=TRUE,features=c('x','y'),labels=TRUE)
}