\name{predict_suretype}
\alias{predict_suretype}
\title{Run classification model using combination of Random Forest and Gaussian Discriminant Analysis}
\usage{
predict_suretype(.data, rf_clf)
}
\arguments{
\item{.data}{Input dataframe coming from \code{scbasic()} or compatible}
\item{rf_clf}{Instance of classifier loaded using \code{scload} currently embodied in RF}

}
\value{
data frame decorated with SureTypeSC genotyping score
}

\description{
Cascade classification model with Random Forest in the first layer and Gaussian Discriminant Analysis in the second layer. This function analyzes the whole dataset comprised in \code{.data} in one batch. To minimize bias in the model, it is recommended to run \code{suretype_model(.)} and build a model per sample basic instead of the whole dataset. 
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

# The Random Forest classifier
clf_instance <- scload(clf) 

#assign prediction results back to the original dataframe using margittr %<>% operator
df %<>% predict_suretype(clf_instance) 
}
