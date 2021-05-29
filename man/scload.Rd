\name{scload}
\alias{scload}
\title{Load classifier from file}
\usage{
scload(filename)
}
\arguments{
\item{filename}{path to a file with classifier}

}
\value{
instance of a classifier
}

\description{
Load pre-trained classifier from file.
}
%\description{
%
%}
\examples{
setwd(system.file(package='SureTypeSCR'))

samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')
clf=system.file('files/rf.clf',package='SureTypeSCR')


#Load data
df=scbasic(manifest,cluster,samplesheet)

rf=scload(clf)
#df %>% calculate_ma() %>% predict_suretype(rf)

}
