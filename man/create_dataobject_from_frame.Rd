\name{create_dataobject_from_frame}
\alias{create_dataobject_from_frame}
\title{Internal function for converting basic data frame from SureTypeSCR to SuretypeSC's python dataobject}
\usage{
create_dataobject_from_frame(df_single)
}
\arguments{
\item{df_single}{data frame used in SureTypeSCR}
}
\value{
SuretypeSC's data object (instance of class Data) containing multiindexed data frame and metadata.
}
\description{
The function returns SureTypeSC's dataobject that contains multindexed pandas data frame and various metadata. This structre is used in some of the SureTypeSC's methods that are called from SureTypeSCR.
}
