\name{predict_suretype}
\alias{predict_suretype}
\title{Run classification model using combination of Random Forest and Gaussian Discriminant Analysis}
\usage{
predict_suretype(.data, clf)
}
\arguments{
\item{.data}{Input dataframe coming from \code{scbasic()} or compatible}
\item{clfname}{Instance of classifierier loaded using \code{scload}}

}
\value{
data frame decorated with SureType genotyping score
}

\description{
Cascade classification model with Random Forest in the first layer and Gaussian Discriminant Analysis in the second layer
}
%\description{
%
%}
\examples{


samplesheet=system.file('files/GSE19247_embryos.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')
clf=system.file('files/rf.clf',package='SureTypeSCR')


#Load data
df=scbasic(manifest,cluster,samplesheet)



# The Random Forest classifier
clf_instance <- scload(clf) 

#assign prediction results back to the original dataframe using margittr %<>% operator
df %<>% predict_suretype(clf_instance) 
}
