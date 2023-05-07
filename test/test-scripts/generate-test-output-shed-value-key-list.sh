#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-value-key-list >$OUTPUT_DIRECTORY/shed-value-key-list.out 2>&1
shed value-key-list >$OUTPUT_DIRECTORY/shed_value-key-list.out 2>&1
