\name{callrate}
\alias{callrate}
\title{Calculates callrate as proportion of called SNPs in the input dataframe}
\usage{
callrate(.data)
}
\arguments{
\item{.data}{data frame from \code{scbasic} or compatible}
}
\value{
The callrate values of all samples
}

\description{
Calculates callrate as proportion of called SNPs in the input dataframe
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


#Get overall callrate
df %>% callrate() 

#Get callrate per individual
df %>% group_by(individual) %>% callrate()

#Get callrate as allelic fractions and pivot to columns
df %>% group_by(individual,gtype) %>% callrate() %>% pivot_wider(names_from=gtype,values_from=Callrate)
}