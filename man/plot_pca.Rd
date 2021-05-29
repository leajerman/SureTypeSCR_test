\name{plot_pca}
\alias{plot_pca}
\title{Run and visualise PCA}
\usage{
plot_pca(.data,by_chrom=TRUE,features=c('x','y'),importances=TRUE,metadata=NULL,labels=TRUE)
}
\arguments{
\item{.data}{dataframe from scbasic or compatible}
\item{by_chrom}{boolean flag  indicating whether to run PCA by chromosome (TRUE or FALSE)}
\item{features}{vector of feature types to use for PCA (columns from  \code{.data} , i.e. c('x','y'))}
\item{importances}{boolean flag indicating whether to render dimension importances (TRUE or FALSE)}
\item{metadata}{data frame with metadata - currently grouping by family is supported, given that \code{metadata} contains \code{familyid} and \code{individual} columns and \code{metadata} will be merged to internal data frame by matching \code{individual}}                                                                                            
\item{labels}{boolean flag indicating whether to render sample names  using package \code{ggrepel} to prevent overplotting  (TRUE or FALSE)}
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
setwd(system.file(package='SureTypeSCR'))

samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)

#create ggplot object with PCA
#df %>% plot_pca(by_chrom=TRUE,features=c('x','y'),labels=TRUE)
}