\name{suretype_model}
\alias{suretype_model}
\title{Create model and perform classification with RF-GDA per sample}
\usage{
suretype_model(df,individual, clf,.sclist=NULL)))
}

\arguments{
\item{df}{Basic dataframe with precalculated M and A features}
\item{individual}{current sample name to be classified}
\item{clf}{path to the classifier - currently support for Random Forest}
\item{.sclist}{list of samples to be processed stored in \code{list()}}
\value{returns data frame with two columns corresponding to the classification results: \code{rfgda_score} and \code{rf_score}, while \code{rfgda_score} is score calculated by cascade RF-GDA algorithm and \code{rf_score} is score calculated by RF.}
}

\description{suretype_model is almost always use with in connection with \code{group_by(invidiual)} and \code{nest()} to create classification model per sample (see example below)}
%\description{
%
%}
\examples{
  setwd(system.file(package='SureTypeSCR'))
  samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
  manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
  cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')
  clf=system.file("files/rf.clf",package="SureTypeSCR")
  
  df_model = df %>%
  calculate_ma() %>%
  group_by(individual) %>%
  nest() %>%
  mutate(model=map(data , function(df) suretype_model(df,individual, clf,.sclist=list('gsm477563')))
}
