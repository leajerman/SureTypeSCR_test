\name{get_threshold}
\alias{get_threshold}
\title{Determine threshold used on the data in data frame}
\usage{
get_threshold(.data,col='score')
}
\arguments{
\item{.data}{basic data frame compatible with output from \code{scbasic(.)}}
\item{col}{column name with score - effective columns GenCall's score (\code{scode}), SureTypeSC's score (\code{rfgda_score}) or single layer SureTypeSC's score (\code{rf_score})}
}
\value{
returns float
}

\description{
Determine score cutoff that was applied on the data - that is all genotypes below the returned value are no-calls.
}
