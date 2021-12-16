# pseudodiploidy

## Retrieve data
```
bash src/getData.sh
```

## Transform data
```
# Build count matrix for DESeq
Rscript src/buildCountMatrix.R \
    data/input/combined_featurecounts.csv \
    data/input/samples.csv \
    data/processed/featurecounts.mat.RDS
    data/processed/pseudohaploid_DEseq_dds.RDS

# Build TPM table for other analyses
Rscript src/buildTPMtable.R \
    data/input/combined_featurecounts.csv \
    data/input/samples.csv \
    data/processed/TPM.txt.gz
```


## Run DESeq
```
Rscript src/runDESeq.R \
    data/input/combined_featurecounts.csv \
    data/input/samples.csv \
    data/processed/featurecounts.mat.RDS
    data/processed/pseudohaploid_DEseq_dds.RDS
```

# Build heatmap
```
Rscript src/heatmap.R
```