#!/usr/bin/env Rscript

library(data.table)
library(ggplot2)
library(ggthemes)
library(foreach)
library(R.utils)
library(DESeq2)

args <- commandArgs(trailingOnly = TRUE)

countsRDSname <- args[1]
coldataFilename <- args[2]
outputFilename <- args[3]

counts <- readRDS(countsRDSname)

coldata <- fread(coldataFilename)
coldataIDs <- coldata[, id]
coldata[, id := NULL]
coldata <- as.data.frame(coldata)
rownames(coldata) <- coldataIDs


dds <- DESeqDataSetFromMatrix(countData=counts, colData=coldata, design = ~background*treatment)

saveRDS(dds, outputFilename)