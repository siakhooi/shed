#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-list-code >$OUTPUT_DIRECTORY/shed-list-code.out 2>&1
shed list-code >$OUTPUT_DIRECTORY/shed_list-code.out 2>&1
