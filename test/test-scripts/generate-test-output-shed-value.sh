#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-value .code                     >$OUTPUT_DIRECTORY/shed-value.out 2>&1
shed-value .name                    >>$OUTPUT_DIRECTORY/shed-value.out 2>&1
shed-value .kubeconfig[0].context   >>$OUTPUT_DIRECTORY/shed-value.out 2>&1
shed-value .kubeconfig[0].namespace >>$OUTPUT_DIRECTORY/shed-value.out 2>&1
shed-value .kubeconfig[1].context   >>$OUTPUT_DIRECTORY/shed-value.out 2>&1
shed-value .kubeconfig[1].namespace >>$OUTPUT_DIRECTORY/shed-value.out 2>&1

shed value .code                     >$OUTPUT_DIRECTORY/shed_value.out 2>&1
shed value .name                    >>$OUTPUT_DIRECTORY/shed_value.out 2>&1
shed value .kubeconfig[0].context   >>$OUTPUT_DIRECTORY/shed_value.out 2>&1
shed value .kubeconfig[0].namespace >>$OUTPUT_DIRECTORY/shed_value.out 2>&1
shed value .kubeconfig[1].context   >>$OUTPUT_DIRECTORY/shed_value.out 2>&1
shed value .kubeconfig[1].namespace >>$OUTPUT_DIRECTORY/shed_value.out 2>&1
