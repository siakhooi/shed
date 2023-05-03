#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-env >$OUTPUT_DIRECTORY/shed-env.out 2>&1
shed env >$OUTPUT_DIRECTORY/shed_env.out 2>&1
