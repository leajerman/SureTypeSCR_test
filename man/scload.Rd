\name{scload}
\alias{scload}
\title{Load Random Forest classifier or Gaussian Discrinimate Analysis}
\usage{
scload(filename)
}
\arguments{
\item{filename}{a pathname to an classifier}

}
\value{
instance of a classifier
}

\description{
Load Random Forest classifier or Gaussian Discrinimate Analysis
}
%\description{
%
%}
\examples{

clf_rf_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
clf_gda_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')

# The Random Forest classifier
clf_rf <- scload(clf_rf_path) 

# The Gaussian Discriminate Analysis classifier
clf_gda <- scload(clf_gda_path) 



}
