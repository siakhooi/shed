#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-kubectl-resources >$OUTPUT_DIRECTORY/shed-kubectl-resources.out 2>&1
shed kubectl-resources >$OUTPUT_DIRECTORY/shed_kubectl-resources.out 2>&1
