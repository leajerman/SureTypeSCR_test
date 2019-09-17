\name{saveresult}
\alias{saveresult}
\title{Save the predictions from different classifiers}
\usage{
#  save the full prediction table
result_end$save_complete_table(filename,header=TRUE) 


# save different mdoes based on the full prediction table 
result_end$save_mode(mode,filename,header=FALSE) 

}

\arguments{
\item{result_end}{The predicted result}

\item{filename}{The path where the result will be saved}

\item{mode}{The criteria to save the result. 
The mode can be recall, standard or precision

recall: using Random Forest classifier and the threshold is 0.15

standard: using the cascade of Random Forest and Guassian Discriminant Analysis, the threshold is 0.75

precision: using the cascade of Random Forest and Guassian Discriminant Analysis, the threshold is 0.15}

\item{header}{the index}

}

\value{
txt file of the results
}

\description{
Save the predictions from different classifiers
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
clf_rf = scload(clf_rf_path) 

# The Gaussian Disciminant Analysis
clf_gda = scload(clf_gda_path) 

# get genotyping data from gtc files and meta file
df <- scbasic(gtc_path,manifest_path,cluster_path,samplesheet,'\t')  

# create Data object and rearrange the index
dfs <- create_from_frame(df) 


#original shape (294602, 15)
#shape after operation (294602, 12)



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

# Train the rf-gda classifier
trainer <- scTrain(result_gda,clfname='gda') 

# The prediction from the cascade of Random Forest and Gaussian Discriminate Analysis
result_end <- trainer$predict_decorate(result_gda,clftype='rf-gda') 

# Save the complete prediction table
result_end$save_complete_table('fulltable.txt',header=TRUE)

# recall mode
result_end$save_mode('recall','recall.txt',header=TRUE) 




}
