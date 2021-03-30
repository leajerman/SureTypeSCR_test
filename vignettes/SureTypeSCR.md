---
title: "SureTypeSCR -- Implementation of algorithm for regenotyping of single cell data."
author: "Ivan Vogel, Lishan Cai"
date: "February 19, 2021"
vignette: >
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteIndexEntry{SureTypeSCR overview}
  %\VignetteEncoding{UTF-8}
output:
  BiocStyle::html_document:
    highlight: pygments
    number_sections: yes
    theme: united
    toc: yes
---

# Introduction

A key motivation of SureTypeSCR is that accurate genotyping of DNA from a single cell is required for application such as de novo mutation detection and linkage analysis, but achieving high precision genotyping in the single cell environment is challenging due to the errors caused by whole genome amplification. 

SureTypeSCR, based on python, is a two-stage machine learning algorithm that filters a substantial part of the noise, thereby retaining of the majority of
the high quality SNPs. SureTypeSCR consists of two layers, Random Forest (RF) and Gaussian Discriminant Analysis (GDA).

# Basic concepts
## Loading dependencies
Make sure to replace the path in `Sys.setenv` to your python interpreter path (command `which python` on Linux/Mac or `where python` on Windows will give you the path)


## Downloading testing data and classifiers


```r
#download classifier CLASSIFIERS.zip
drive_download(as_id('1wBPSMQiuY50Zct9Re2LkqaQgHwuu0k6k'),overwrite=TRUE)

#download testing data TESTING_DATA_2SAMPLES.zip
drive_download(as_id('1SUDvgEyynXuAmgECHVrzx6pPoJ5PnNy1'),overwrite=TRUE)

unzip('CLASSIFIERS.zip')
unzip('TESTING_DATA_2SAMPLES.zip')

gtc_path = 'TESTING_DATA_2SAMPLES/GTCs'
cluster_path = 'TESTING_DATA_2SAMPLES/HumanKaryomap-12v1_A.egt'
manifest_path = 'TESTING_DATA_2SAMPLES/HumanKaryomap-12v1_A.bpm'
samplesheet_path = 'TESTING_DATA_2SAMPLES/Samplesheetr.csv'
clf_rf_path = 'CLASSIFIERS/clf_30trees_7228_ratio1_lightweight.clf'
```

## Loading the raw genotypes into data frame


```r
df <- scbasic_IV(samplesheet=samplesheet_path,
                 bpm=manifest_path,
                 egt=cluster_path)

head(df)
```

```
##          Name Chr  Position individual gtype score          x x_raw           y
## 1 cnvi0111185  13 100631779       sc21    NC     0 0.04966530  2338 0.722731471
## 2 cnvi0111185  13 100631779       sc22    NC     0 0.03279352  1653 0.715796053
## 3 cnvi0111186   2 177058958       sc21    NC     0 0.09674699  3367 0.007499145
## 4 cnvi0111186   2 177058958       sc22    NC     0 0.67909896 20297 0.016609475
## 5 cnvi0111187  17  35295593       sc21    NC     0 0.06427670  3207 1.656550407
## 6 cnvi0111187  17  35295593       sc22    NC     0 0.03554662  1836 0.916964293
##   y_raw
## 1 19367
## 2 19016
## 3   879
## 4  1140
## 5 47531
## 6 26539
```

## Quality check
### Call rate per sample


```r
df %>% callrate_IV()
```

```
##    Callrate
## 1 0.8080733
```

The genotypes from GTC files are sometimes preprocessed with certain GenCall score threshold. Threshold > 0 generally means the data has been subjected to quality control in one of the previous steps and is truncated (genotypes with score lower than threshold are set to NC). QC usually occurs during IDAT -> GTC and the Gencall score threshold is often 0.15 which is Illumina's recommended value for bulk DNA. It is advised to use GTC files with GenCall score threshold set to 0 and then subsequently use the built-in classifier. This maximizes recall. 


```r
df %>% get_threshold()
```

```
##   threshold
## 1  0.150012
```

It is possible to retrieve call rates by group, i.e. by individual.

```r
df %>% 
  group_by(individual)  %>% 
  callrate_IV()
```

```
## # A tibble: 2 x 2
##   individual Callrate
##   <chr>         <dbl>
## 1 sc21          0.804
## 2 sc22          0.812
```
... or more complex group-by operations with multiple factors

```r
df %>% 
  group_by(individual,Chr,gtype) %>% 
  callrate_IV()
```

```
## # A tibble: 200 x 4
## # Groups:   individual, Chr, gtype [200]
##    individual Chr   gtype Callrate
##    <chr>      <chr> <chr>    <dbl>
##  1 sc21       1     AA      0.326 
##  2 sc21       1     AB      0.0886
##  3 sc21       1     BB      0.394 
##  4 sc21       1     NC      0.191 
##  5 sc21       10    AA      0.332 
##  6 sc21       10    AB      0.0942
##  7 sc21       10    BB      0.394 
##  8 sc21       10    NC      0.180 
##  9 sc21       11    AA      0.322 
## 10 sc21       11    AB      0.0895
## # ... with 190 more rows
```
It is perhaps convenient to pivot some of the grouped features to get better overview of the results

```r
df %>% 
  group_by(individual,Chr,gtype) %>% 
  callrate_IV() %>% 
  pivot_wider(names_from=gtype,values_from=Callrate)
```

```
## # A tibble: 50 x 6
## # Groups:   individual, Chr [50]
##    individual Chr      AA     AB    BB    NC
##    <chr>      <chr> <dbl>  <dbl> <dbl> <dbl>
##  1 sc21       1     0.326 0.0886 0.394 0.191
##  2 sc21       10    0.332 0.0942 0.394 0.180
##  3 sc21       11    0.322 0.0895 0.402 0.187
##  4 sc21       12    0.331 0.100  0.399 0.170
##  5 sc21       13    0.321 0.107  0.376 0.196
##  6 sc21       14    0.319 0.102  0.387 0.193
##  7 sc21       15    0.328 0.0893 0.391 0.192
##  8 sc21       16    0.299 0.0974 0.382 0.222
##  9 sc21       17    0.309 0.0790 0.395 0.217
## 10 sc21       18    0.338 0.0924 0.382 0.188
## # ... with 40 more rows
```

User can set own threshold which affects callrate:

```r
df %>% 
  set_threshold(clfcol = 'score',threshold = 0.5) %>% 
  group_by(individual) %>% 
  callrate_IV() 
```

```
## # A tibble: 2 x 2
##   individual Callrate
##   <chr>         <dbl>
## 1 sc21          0.723
## 2 sc22          0.732
```

### MA transformation
Logarithmic difference (M) and logarithmic average (A) give an overview of the quality of the signal and distribution of the 3 genotypes. Function calculate_ma_IV(.) performs transformation on both, raw intensities (x_raw,y_raw) and normalized intensities (x,y) and therefore generates 4 additional features to the original dataframe

```r
df %>% calculate_ma_IV() %>% head()
```

```
##          Name Chr  Position individual         a    a_raw gtype         m
## 1 cnvi0111185  13 100631779       sc21 -2.400043 12.71619    NC -3.863150
## 2 cnvi0111185  13 100631779       sc22 -2.706412 12.45290    NC -4.448066
## 3 cnvi0111186   2 177058958       sc21 -5.214349 10.74848    NC  3.689419
## 4 cnvi0111186   2 177058958       sc22 -3.235078 12.23190    NC  5.353543
## 5 cnvi0111187  17  35295593       sc21 -1.615689 13.59179    NC -4.687742
## 6 cnvi0111187  17  35295593       sc22 -2.469603 12.76909    NC -4.689081
##       m_raw score          x x_raw           y y_raw
## 1 -3.050254     0 0.04966530  2338 0.722731471 19367
## 2 -3.524055     0 0.03279352  1653 0.715796053 19016
## 3  1.937529     0 0.09674699  3367 0.007499145   879
## 4  4.154161     0 0.67909896 20297 0.016609475  1140
## 5 -3.889572     0 0.06427670  3207 1.656550407 47531
## 6 -3.853476     0 0.03554662  1836 0.916964293 26539
```

```r
#head(df)
```

MA plots give an overview of potential channel imbalances and give basic information about the noisiness of the sample   


```r
#df %>% set_threshold(clfcol='score',threshold=0.5) %>% plot_ma()
ma_plot=df %>% plot_ma()
ma_plot
```

```
## `geom_smooth()` using method = 'gam' and formula 'y ~ s(x, bs = "cs")'
```

![plot of chunk plotma](figure/plotma-1.png)

### PCA
The built-in function `plot_pca(.)` allows to perform PCA on one or multiple features (defined by parameter) accross all loci.


```r
pca_plot = df %>% plot_pca(feat=c('gtype'))
pca_plot
```

![plot of chunk PCA](figure/PCA-1.png)

### Regenotyping on a pretrained SC classifier
First load the Random Forest classifier

```r
clf_rf= scload('CLASSIFIERS/clf_30trees_7228_ratio1_lightweight.clf')
```
And run the classification:

```r
df %<>% predict_suretype(clf_rf)
```
The prediction adds few new columns with scoring using single layer classifiaction with Random Forest (RF, feature name rf_score) and cascade classification with RF and Gaussian Discriminant Analysis (GDA, feature name: rf-gda_score). The Gencall 'score' column is renamed to 'gencall_score' to keep consistent nomenclature.

```r
df %>% filter(Chr==1) %>% head()
```

```
##          Name Chr  Position individual         a    a_raw gtype          m
## 1 cnvi0111219   1  47875450       sc21 -2.537236 12.72809    NC -4.3560452
## 2 cnvi0111219   1  47875450       sc22 -3.748012 11.62615    NC -4.2027190
## 3 cnvi0111224   1 244208615       sc21 -3.605926 11.55661    NC  0.8052142
## 4 cnvi0111224   1 244208615       sc22 -2.005109 12.98414    NC -2.7107714
## 5 cnvi0111243   1 244206015       sc21 -4.906760 10.70092    NC  1.8541112
## 6 cnvi0111243   1 244206015       sc22 -3.878710 11.69221    NC  4.9545218
##        m_raw rf-gda_score rf_score gencall_score          x x_raw          y
## 1 -3.4859097          NaN      NaN             0 0.03806850  2027 0.77958965
## 2 -3.2020251          NaN      NaN             0 0.01734457  1042 0.31938025
## 3  0.6221121          NaN      NaN             0 0.10856879  3737 0.06213143
## 4 -2.4014678          NaN      NaN             0 0.09736215  3525 0.63740236
## 5  1.0569922          NaN      NaN             0 0.06338547  2401 0.01753261
## 6  3.5917588          NaN      NaN             0 0.37854868 11490 0.01220849
##   y_raw
## 1 22710
## 2  9589
## 3  2428
## 4 18624
## 5  1154
## 6   953
```
