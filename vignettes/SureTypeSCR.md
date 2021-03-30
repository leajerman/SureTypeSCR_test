---
title: "SureTypeSCR -- Implementation of algorithm for regenotyping of single cell data."
author: "Ivan Vogel, Lishan Cai"
date: "February 18, 2021"
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

This package also includes quality check (call rate, principle component analysis etc.)
# Basic concepts

























