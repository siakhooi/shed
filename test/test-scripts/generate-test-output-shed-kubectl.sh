#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

source /usr/lib/shed/shed-init
shed-use T
shed-values >$OUTPUT_DIRECTORY/shed-values-T-0.out 2>&1
shed-kubectl get po >$OUTPUT_DIRECTORY/shed-kubectl-get-po-T-0.out 2>&1
shed-use D
shed-values >$OUTPUT_DIRECTORY/shed-values-D-0.out 2>&1
shed-kubectl get po >$OUTPUT_DIRECTORY/shed-kubectl-get-po-D-0.out 2>&1
shed-kubeconfig-use 1
shed-values >$OUTPUT_DIRECTORY/shed-values-D-1.out 2>&1
shed-kubectl get po >$OUTPUT_DIRECTORY/shed-kubectl-get-po-D-1.out 2>&1
