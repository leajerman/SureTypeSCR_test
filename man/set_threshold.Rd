\name{set_threshold}
\alias{set_threshold}
\title{Set threshold given a classification method}
\usage{
set_threshold(.data,clfcol,threshold)
}
\arguments{
\item{.data}{dataframe from scbasic or compatible}
\item{clfcol}{column representing classification score}
\item{threshold}{threshold from 0 to 1}
}
\value{
data frame with gtype set to NC for classification score below chosen threshold
}

\description{
Function truncates the gtypes given a threshold an classification method.  
}
%\description{
%
%}
\examples{

# Changing Gencall score threshold 
df %>% set_threshold(clfcol='score',threshold=0.5)
}