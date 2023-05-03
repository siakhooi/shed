#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-list >$OUTPUT_DIRECTORY/shed-list.out 2>&1
shed list >$OUTPUT_DIRECTORY/shed_list.out 2>&1
