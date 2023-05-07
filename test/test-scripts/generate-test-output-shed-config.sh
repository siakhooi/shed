#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-config >$OUTPUT_DIRECTORY/shed-config.out 2>&1
shed config >$OUTPUT_DIRECTORY/shed_config.out 2>&1
