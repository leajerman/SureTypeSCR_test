\name{scsave}
\alias{scsave}
\title{Save the predictions from different classifiers}
\usage{

# save different mdoes based on the full prediction table 
scsave(result,filename,header=TRUE,clftype='rf',threshold=0.15,all=FALSE) 

}

\arguments{
\item{result}{The predicted result}

\item{filename}{The path where the result will be saved}

\item{header}{the index}

\item{clftype}{classifier type}

\item{threshold}{the threshold of gencall score}

\item{all}{if the users want to save the full table or not}

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
df <- scbasic(manifest_path,cluster_path,samplesheet)  

# create Data object and rearrange the index
dfs <- create_from_frame(df) 


#original shape (294602, 15)
#shape after operation (294602, 12)



# extract the chromosomes 1 and 2
dfs <- restrict_chrom(dfs,c('1','2')) 

# mask the Gencall score lower than 0.01
dfs <- apply_thresh(dfs,0.01) 

# calculate the m and a feature
dfs <- calculate_ma(dfs) 

# prediction by Random Forest
result_rf <- scpredict(clf_rf,dfs,clftype='rf')

# prediction by Guassian Discriminate Analysis
result_gda <- scpredict(clf_gda,dfs,clftype='gda')

# Train the rf-gda classifier
trainer <- scTrain(result_gda,clfname='gda') 

# The prediction from the cascade of Random Forest and Gaussian Discriminate Analysis
result_end <- scpredict(trainer,result_gda,clftype='rf-gda') 

# Save the complete prediction table
scsave(result_end,'fulltable.txt',clftype='rf',header=TRUE,threshold=0.15,all=TRUE)

# recall mode
scsave(result_end,'fulltable.txt',clftype='rf',threshold=0.15,header=TRUE,all=FALSE)
 


}
