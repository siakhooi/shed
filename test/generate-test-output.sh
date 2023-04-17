#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-env >$OUTPUT_DIRECTORY/shed-env.out
shed env >$OUTPUT_DIRECTORY/shed_env.out

shed-list >$OUTPUT_DIRECTORY/shed-list.out
shed list >$OUTPUT_DIRECTORY/shed_list.out

shed-list-code >$OUTPUT_DIRECTORY/shed-list-code.out
shed list-code >$OUTPUT_DIRECTORY/shed_list-code.out

shed-values >$OUTPUT_DIRECTORY/shed-values.out
shed values >$OUTPUT_DIRECTORY/shed_values.out

shed-value-key-list >$OUTPUT_DIRECTORY/shed-value-key-list.out
shed value-key-list >$OUTPUT_DIRECTORY/shed_value-key-list.out

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
    MANWIDTH=120 man --pager=cat "$i" >$OUTPUT_DIRECTORY/man_${i}.out
done

ALL_MAN_PAGES_5=(
    shed-config.yaml
)
for i in ${ALL_MAN_PAGES_5[@]}; do
    MANWIDTH=120 man -s 5 --pager=cat "$i" >$OUTPUT_DIRECTORY/man_${i}.out
done
