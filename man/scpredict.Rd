\name{scpredict}
\alias{scpredict}
\title{Internal function used for prediction with \code{suretype_model(.)}}
\usage{
scpredict(.data,clf,clftype='rf')
}

\arguments{
\item{.data}{data frame containing \code{m} and \code{a} features}
\item{clf}{instance of a classifier}
\item{clftype}{The type of classifier}
}
\value{
data frame with predicted score using given classifier in \code{clf}
}

\description{Internal function that evaluates score given an instance of classifier. The function is used in \code{suretype_model(.)}}
%\description{
%
%}


