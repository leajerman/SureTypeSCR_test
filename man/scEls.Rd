\name{scEls}
\alias{scEls}
\title{mediate access to python modules}
\usage{
scEls()
}
\value{
list of (S3) "python.builtin.module"
}
\description{
mediate access to python modules
}
\note{
Returns a list with elements sc (SureTypeSC), pd (pandas)each
referring to python modules.
}
\examples{
els = scEls()

els

##$sc
##Module(SureTypeSC)

##$pd
##Module(pandas) 
}
