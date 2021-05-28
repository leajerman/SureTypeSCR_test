\name{get_multiind_df}
\alias{get_multiind_df}
\title{Internal function that creates data frame with multiindex}
\usage{
get_multiind_df(df)
}
\arguments{
\item{df}{R data frame as returned by function \code{scbasic(.)} or compatible}
}
\value{
returns data frame with multiindex
}

\description{
Internal function for index conversion. Function converts R data frame to a Python pandas dataframe with multiindex, that is compatible with Python methods implemented in SureTypeSC. 
}
