\name{plot_pca}
\alias{plot_pca}
\title{Run and visualise PCA}
\usage{
plot_pca(.data,by_chrom,features,labels)
}
\arguments{
\item{.data}{dataframe from scbasic or compatible}
\item{by_chrom}{boolean flag  indicating whether to run PCA by chromosome (TRUE or FALSE)}
\item{features}{vector of features types to use for PCA, i.e. c('x','y')}
\item{labels}{flag indicating whether to show dimension importance for 2D PCA (TRUE or FALSE)}
}
\value{
ggplot object with PCA plot
}

\description{
Function creates feature matrix from non-zero SNPs and  feature types indicated in \code{features}. The feature matrix used for calculating PCA has \code{n} rows and \code{k} columns, while \code{n} corresponds to number of individuals in the data frame and \code{k} is defined as length of \code{features} x number of non-zero SNPs across all samples.       
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

#create ggplot object with PCA
df %>% plot_pca(by_chrom=TRUE,features=c('x','y'),labels=TRUE)
}