\name{scTrain}
\alias{scTrain}
\title{Train Gaussian Discriminate Analysis by using the output of predicitons of Random Forest}
\usage{
scTrain(trainingdata, clfname='gda')
}
\arguments{
\item{trainingdata}{Data object, the training data of scTrain}
\item{clfname}{The classifier type}

}
\value{
instance of a classifier
}

\description{
Train Gaussian Discriminate Analysis by using the output of predicitons of Random Forest
}
%\description{
%
%}
\examples{

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')
clf_rf_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
clf_gda_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')



# The Random Forest classifier
clf_rf <- scload(clf_rf_path) 

# The Gaussian Disciminant Analysis
clf_gda <- scload(clf_gda_path) 

 # get genotyping data from gtc files and meta file
df <- scbasic(gtc_path,manifest_path,cluster_path,samplesheet,'\t')
 
# create Data object and rearrange the index
dfs <- create_from_frame(df) 

# extract the chromosomes 1 and 2
dfs$restrict_chromosomes(c('1','2')) 
 
# mask the Gencall score lower than 0.01
dfs$apply_NC_threshold_3(0.01) 

# calculate the m and a feature
dfs$calculate_transformations_2() 

# prediction by Random Forest
result_rf <- clf_rf$predict_decorate(dfs,clftype='rf') 

# prediction by Guassian Discriminante Analysis
result_gda <- clf_gda$predict_decorate(dfs,clftype='gda') 

# Train the rf-gda classifier
trainer <- scTrain(result_rf,clfname='gda')

# The prediction from the cascade of Random Forest and Gaussian Discriminate Analysis
result_end <- trainer$predict_decorate(result_gda,clftype='rf-gda') 




 
}
