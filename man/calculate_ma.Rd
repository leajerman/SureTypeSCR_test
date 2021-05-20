\name{calculate_ma}
\alias{calculate_ma}
\title{Calculated M (logarithmic difference) and A (logarithmic average) of itensity signals}
\usage{
calculate_ma(.data)
}
\arguments{
\item{df}{data frame from \code{scbasic()} or compatible}
}
\value{
\code{.data} with extra columns representing the results of MA transformation (m, a, m_raw and a_raw)
}

\description{
Logartihmic transformation is a preliminary step for classification using SureTypeSC 
}
\examples{
setwd(system.file(package='SureTypeSCR'))
samplesheet=system.file('files/GSE19247_example.csv',package='SureTypeSCR')
manifest=system.file('files/HumanCytoSNP-12v2_H.bpm',package='SureTypeSCR')
cluster=system.file('files/HumanCytoSNP-12v2_H.egt',package='SureTypeSCR')

#Load data
df=scbasic(manifest,cluster,samplesheet)

#calculate MA transform and store in the original dataframe using margittr %<>% operator
df %<>% calculate_ma()
}