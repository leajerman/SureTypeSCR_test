\name{scTrain}
\alias{scTrain}
\title{Internal function that fits parameters of GDA to given data}
\usage{
scTrain(trainingdata,clfname='gda')
}
\arguments{
\item{trainingdata}{intermediate results of RF classification}
\item{clfname}{name of the classifier to be fitted parameters for, currently 'Gaussian discriminant analysis' (GDA) is supported and change of this parameter will only have effect on column name in the resulting data frame.}
}
\value{
instance of a GDA classifier
}

\description{
Internal function that creates GDA classifier based on the results of first layer (RF).}

