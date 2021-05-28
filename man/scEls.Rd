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
Returns a list containing objects \code{sc} and \code{pd} that refer to Python modules SureTypeSC and pandas, respectively.
}
\examples{
els = scEls()
els
##$sc
##Module(SureTypeSC)

##$pd
##Module(pandas) 
}
