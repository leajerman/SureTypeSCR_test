\name{Dataobject}
\alias{Dataobject}
\title{The methods for Data object based on python}
\usage{

# extract the chromosomes 
dfs$restrict_chromosomes(chrom) 

# mask all the Gencall scores lower than the threshold
dfs$apply_NC_threshold_3(threshold)

# calcuate the m and a features
dfs$calculate_transformations_2() 

# return the values of Data object
dfs$df 
}
\arguments{
\item{dfs}{Data object}
\item{chrom}{A list of names of chromosomes }
\item{threshold}{The threshold applied on the Gencall score}
\item{df}{The attribute of dfs and will return the values}
}


\value{
The modified Data object:

restrict_chromosomes will extract the chromosomes specified in chrom; 

apply_NC_threshold_3 will mask all the Gencall scores lower than the threshold;

calculate_transfromation_2 will calcuate the m and a features based on normalised x and y intensities

df will return the values of Data object

}

\description{
The different methods for Data object based on python
}

\examples{
gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

 # get genotyping data from gtc files and meta files
df <- scbasic(manifest_path,cluster_path,samplesheet,'\t')


 
# create Data object and rearrange the index
dfs <- create_from_frame(df) 

# extract the chromosomes 1 and 2
dfs$restrict_chromosomes(c('1','2'))
 
# mask the Gencall score lower than 0.01
dfs$apply_NC_threshold_3(0.01) 

# calculate the m and a feature
dfs$calculate_transformations_2() 

}
