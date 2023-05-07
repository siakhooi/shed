#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

ALL_MAN_PAGES_1=(
    shed-aliases
    shed-config-edit
    shed-config-get
    shed-config
    shed-env
    shed-helm
    shed-istioctl
    shed-kubeconfig-use
    shed-kubectl-exec-bash
    shed-kubectl-exec-sh
    shed-kubectl-logs-follow
    shed-kubectl-scale
    shed-kubectl
    shed-list-code
    shed-list
    shed-use
    shed-value-key-list
    shed-value
    shed-values
    shed
)

for i in ${ALL_MAN_PAGES_1[@]}; do
    MANWIDTH=120 man --pager=cat "$i" >$OUTPUT_DIRECTORY/man_${i}.out 2>&1
done
