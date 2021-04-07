\name{scload}
\alias{scload}
\title{Load classifier}
\usage{
scload(filename)
}
\arguments{
\item{filename}{a pathname to an classifier}

}
\value{
instance of a classifier
}

\description{
Load pretrained classifier
}
%\description{
%
%}
\examples{


#gtc_path=system.file('files/GTCs',package='SureTypeSCR')
samplesheet=system.file('files/GSE19247_embryos.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')
clf=system.file('files/rf.clf',package='SureTypeSCR')


#Load data
df=scbasic(manifest,cluster,samplesheet)

rf=scload(clf)
df %>% calculate_ma() %>% predict_suretype(rf)

}
