\name{scpredict}
\alias{scpredict}
\title{Predictions from Random Forest classifier or Gaussian Discriminant Analysis}
\usage{

clf_rf$predict_decorate(test,clftype='rf')

}

\arguments{
\item{clf_rf}{classifier load by using scload}
\item{test}{Data object including m and a feature}
\item{clftype}{The type of classifier 
(rf: Random Forest; 

gda: Gaussian Discriminant Analysis; 

rf-gda: the cascade of Random Forest and Gaussian Discriminant Analysis)}

}
\value{
The prediction Data object.  

The predicted items might include:

rf_ratio:1_pred: Random Forest prediction (binary) 

rf_ratio:1_prob: Random Forest Score for the positive class

gda_ratio:1_prob: Gaussian Discriminant Analysis score for the positive class 

gda_ratio:1_pred: Gaussian Disciminant Analysis prediction (binary)

rf-gda_ratio:1_prob: combined 2-layer RF and GDA - probability score for the positive class

rf-gda_ratio:1_pred: binary prediction of RF-GDA 

}

\description{Predictions from Random Forest classifier or Gaussian Discriminant Analysis

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
df <- scbasic(manifest_path,cluster_path,samplesheet,'\t')
 
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

# prediction by Guassian Discriminate Analysis
result_gda <- clf_gda$predict_decorate(dfs,clftype='gda') 


}
