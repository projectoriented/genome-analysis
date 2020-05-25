setwd("~/Documents/bioinformatics-msc/genome-analysis/analyses/03_annotations/counts-htseq/")
library("DESeq2")

cts <- as.matrix(read.table("all-counts.tsv2", header = T, row.names = "pilon"))
coldata <- read.table("sra-meta.tsv", header = T, sep = "\t", row.names = 1, stringsAsFactors = T)

all(rownames(coldata) %in% colnames(cts));all(rownames(coldata) == colnames(cts))

dds <- DESeqDataSetFromMatrix(countData = cts, colData = coldata, design = ~ replicate)
dds <- DESeq(dds)
res <- results(dds)
plotMA(res, ylim=c(-10,10))

# this gives log2(n + 1)
ntd <- normTransform(dds)
library("vsn")
meanSdPlot(assay(ntd))

library("pheatmap")
select <- order(rowMeans(counts(dds,normalized=TRUE)),
                decreasing=TRUE)[1:50]
df <- as.data.frame(colData(dds)[,c("replicate","location")])
pheatmap(assay(ntd)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=df)

res05 <- results(dds, alpha=0.05)
summary(res05)

resultsNames(dds)
library("apeglm")
resLFC <- lfcShrink(dds, coef="replicate_Durio.z..Musang.King_vs_Durio.z..Monthong", type="apeglm")

# PCA
vsd <- varianceStabilizingTransformation(dds, blind = FALSE)
rld <- rlog(dds, blind=FALSE)
head(assay(vsd), 3)

meanSdPlot(assay(vsd))

plotPCA(vsd, intgroup=c("replicate", "location"))