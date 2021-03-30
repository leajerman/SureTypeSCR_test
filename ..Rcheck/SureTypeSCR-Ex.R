pkgname <- "SureTypeSCR"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('SureTypeSCR')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("allele_freq")
### * allele_freq

flush(stderr()); flush(stdout())

### Name: allele_freq
### Title: The frequency function is to calculate the allele frequency over
###   all the samples
### Aliases: allele_freq

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- allele_freq(df,th=0.2) 







cleanEx()
nameEx("apply_thresh")
### * apply_thresh

flush(stderr()); flush(stdout())

### Name: apply_thresh
### Title: To apply threshold over all samples on GenCall score
### Aliases: apply_thresh

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

df <- create_from_frame(df)

df <- apply_thresh(df,0.01)







cleanEx()
nameEx("calculate_ma")
### * calculate_ma

flush(stderr()); flush(stdout())

### Name: calculate_ma
### Title: To calculate m and a features
### Aliases: calculate_ma

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

df <- create_from_frame(df)

dfs <- calculate_ma(df)







cleanEx()
nameEx("callrate")
### * callrate

flush(stderr()); flush(stdout())

### Name: callrate
### Title: The callrate function is to calculate the allele frequency over
###   all the samples
### Aliases: callrate

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- callrate(df,th=0.2) 







cleanEx()
nameEx("callrate_chr")
### * callrate_chr

flush(stderr()); flush(stdout())

### Name: callrate_chr
### Title: The callrate function is to calculate the allele frequency over
###   all the samples of one specific chromosome
### Aliases: callrate_chr

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- callrate_chr(df,'1',th=0.2) 







cleanEx()
nameEx("create_from_frame")
### * create_from_frame

flush(stderr()); flush(stdout())

### Name: create_from_frame
### Title: convert pandas dataframe to Data object
### Aliases: create_from_frame

### ** Examples


gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

# get genotyping data from gtc files and meta file
df <- scbasic(manifest_path,cluster_path,samplesheet)


# create Data object and rearrange the index
df <- create_from_frame(df)





cleanEx()
nameEx("locus_cluster")
### * locus_cluster

flush(stderr()); flush(stdout())

### Name: locus_cluster
### Title: To do intensity aggregation at a specific locus
### Aliases: locus_cluster

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- locus_cluster(df,'rs3128117') 







cleanEx()
nameEx("locus_ma")
### * locus_ma

flush(stderr()); flush(stdout())

### Name: locus_ma
### Title: To do m and a aggregation at a specific locus
### Aliases: locus_ma

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- locus_ma(df,'rs3128117') 







cleanEx()
nameEx("pca_chr")
### * pca_chr

flush(stderr()); flush(stdout())

### Name: pca_chr
### Title: To apply principle component annalysis on frequency dataframe of
###   samples of one chromosome
### Aliases: pca_chr

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- pca_chr(df,'X') 







cleanEx()
nameEx("pca_samples")
### * pca_samples

flush(stderr()); flush(stdout())

### Name: pca_samples
### Title: To apply principle component annalysis on frequency dataframe of
###   samples
### Aliases: pca_samples

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- pca_samples(df,th=0.2) 







cleanEx()
nameEx("restrict_chrom")
### * restrict_chrom

flush(stderr()); flush(stdout())

### Name: restrict_chrom
### Title: To choose certain chromosomes with Data object
### Aliases: restrict_chrom

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

df <- create_from_frame(df)

df <- restrict_chrom(df,c('1','2'))







cleanEx()
nameEx("sample_ma")
### * sample_ma

flush(stderr()); flush(stdout())

### Name: sample_ma
### Title: To do m and a aggregation at a specific chromosome of a specific
###   sample
### Aliases: sample_ma

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)

# The Random Forest classifier
call <- sample_ma(df,'Kit4_4mos_SC21','1') 






cleanEx()
nameEx("scEls")
### * scEls

flush(stderr()); flush(stdout())

### Name: scEls
### Title: mediate access to python modules
### Aliases: scEls

### ** Examples

els = scEls()

els

##$sc
##Module(SureTypeSC)

##$pd
##Module(pandas) 



cleanEx()
nameEx("scTrain")
### * scTrain

flush(stderr()); flush(stdout())

### Name: scTrain
### Title: Train Gaussian Discriminate Analysis by using the output of
###   predicitons of Random Forest
### Aliases: scTrain

### ** Examples


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
df <- scbasic(manifest_path,cluster_path,samplesheet)
 
# create Data object and rearrange the index
dfs <- create_from_frame(df) 

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
trainer <- scTrain(result_rf,clfname='gda')

# The prediction from the cascade of Random Forest and Gaussian Discriminate Analysis
result_end <- scpredict(trainer,result_gda,clftype='rf-gda') 




 



cleanEx()
nameEx("sc_allele_freq")
### * sc_allele_freq

flush(stderr()); flush(stdout())

### Name: sc_allele_freq
### Title: This function is to calculate the allele frequency over all the
###   samples
### Aliases: sc_allele_freq

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)


# create Data object and rearrange the index
df <- create_from_frame(df)

# The Random Forest classifier
call <- sc_allele_freq(df,'score',0.2) 







cleanEx()
nameEx("sc_callrate")
### * sc_callrate

flush(stderr()); flush(stdout())

### Name: sc_callrate
### Title: The callrate function is to calculate the allele frequency over
###   all the samples
### Aliases: sc_callrate

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)


# create Data object and rearrange the index
df <- create_from_frame(df)

# The Random Forest classifier
call <- sc_callrate(df,'score',0.2) 







cleanEx()
nameEx("sc_callrate_chr")
### * sc_callrate_chr

flush(stderr()); flush(stdout())

### Name: sc_callrate_chr
### Title: The callrate function is to calculate the allele frequency of
###   all the samples of one chromosome
### Aliases: sc_callrate_chr

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)


# create Data object and rearrange the index
df <- create_from_frame(df)

# The Random Forest classifier
call <- sc_callrate_chr(df,'score',0.2,'21') 







cleanEx()
nameEx("sc_chr_freq")
### * sc_chr_freq

flush(stderr()); flush(stdout())

### Name: sc_chr_freq
### Title: This function is to calculate the allele frequency over all the
###   samples of one chromosome
### Aliases: sc_chr_freq

### ** Examples


# parsing file from gtc raw files

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

df <- scbasic(manifest_path,cluster_path,samplesheet)


# create Data object and rearrange the index
df <- create_from_frame(df)

# The Random Forest classifier
call <- sc_chr_freq(df,'score',0.2,'21') 







cleanEx()
nameEx("scbasic")
### * scbasic

flush(stderr()); flush(stdout())

### Name: scbasic
### Title: Function to process raw gtc data and meta data without
###   genomestudio
### Aliases: scbasic

### ** Examples

gtc_path = system.file("files/GTCs",package='SureTypeSCR')
cluster_path = system.file('files/HumanKaryomap-12v1_A.egt',package='SureTypeSCR')
manifest_path = system.file('files/HumanKaryomap-12v1_A.bpm',package='SureTypeSCR')
samplesheet = system.file('files/Samplesheetr.csv',package='SureTypeSCR')

# get genotyping data from gtc files and meta file
df <- scbasic(manifest_path,cluster_path,samplesheet)

#/Users/apple/anaconda3/envs/gtc2/lib/python2.7/site-packages/sklearn/ensemble/weight_boosting.py:29: 
#DeprecationWarning: numpy.core.umath_tests is an internal NumPy module and should not be imported. 
#It will be removed in a future NumPy release.
  #from numpy.core.umath_tests import inner1d
#Reading cluster file
#Reading sample file
#Number of samples: 2
#Reading manifest file
#Initializing genotype data
#Generating
#9968648019_R06C01
#9968648019_R06C02
#Finish parsing






cleanEx()
nameEx("scload")
### * scload

flush(stderr()); flush(stdout())

### Name: scload
### Title: Load Random Forest classifier or Gaussian Discrinimate Analysis
### Aliases: scload

### ** Examples


clf_rf_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')
clf_gda_path = system.file('files/clf_30trees_7228_ratio1_lightweight.clf',package='SureTypeSCR')

# The Random Forest classifier
clf_rf <- scload(clf_rf_path) 

# The Gaussian Discriminate Analysis classifier
clf_gda <- scload(clf_gda_path) 






cleanEx()
nameEx("scpredict")
### * scpredict

flush(stderr()); flush(stdout())

### Name: scpredict
### Title: Predictions from Random Forest classifier or Gaussian
###   Discriminant Analysis
### Aliases: scpredict

### ** Examples


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
df <- scbasic(manifest_path,cluster_path,samplesheet)
 
# create Data object and rearrange the index 
dfs <- create_from_frame(df) 

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





cleanEx()
nameEx("scsave")
### * scsave

flush(stderr()); flush(stdout())

### Name: scsave
### Title: Save the predictions from different classifiers
### Aliases: scsave

### ** Examples


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
 





### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
