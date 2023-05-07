#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-values >$OUTPUT_DIRECTORY/shed-values.out 2>&1
shed values >$OUTPUT_DIRECTORY/shed_values.out 2>&1
