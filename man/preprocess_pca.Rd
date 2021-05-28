\name{preprocess_pca}
\alias{preprocess_pca}
\title{Internal function that calculates matrix for principal component analysis}
\usage{
preprocess_pca(.data,.group,features=c('x','y'))
}
\arguments{
\item{.data}{output data frame from \code{scbasic(.)} or compatible}
\item{.group}{formal parameter effective when run under \code{group_by(.)} and \code{nest(.)} from \code{tidyverse}}
\item{features}{list of columns from the \code{.data} data frame that will be used for creation of the feature matrix}
}
\value{
matrix formatted for PCA analysis using \code{stats::prcomp(.)}
}

\description{
Internal function that preprocesses feature matrix for PCA. Output of this function is used in \code{plot_pca(.)}       
}
