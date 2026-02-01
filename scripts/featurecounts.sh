#!/bin/bash

ANNOTATION="/home/phantomprash/rna_seq_project/fastq/Homo_sapiens.GRCh38.114.gtf"
OUTDIR="/home/phantomprash/rna_seq_project/fastq/quants"
THREADS=8

mkdir -p "$OUTDIR"

echo "FeatureCounts started at: $(date)"
echo "------------------------------------"

for bam in *.bam; do
    start=$(date +%s)
    sample=$(basename "$bam" .bam)

    echo "Processing $sample ..."

    featureCounts \
        -T $THREADS \
        -s 0 \
        -a "$ANNOTATION" \
        -o "$OUTDIR/${sample}_featurecounts.txt" \
        "$bam"

    exit_code=$?

    end=$(date +%s)
    runtime=$(( (end - start) / 60 ))

    if [ $exit_code -eq 0 ]; then
        echo "✅ Completed $sample in $runtime minutes."
    else
        echo "❌ Failed for $sample (exit code: $exit_code)"
    fi

    echo "------------------------------------"
done

echo "All jobs finished at: $(date)"
