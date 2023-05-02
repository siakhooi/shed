#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-env >$OUTPUT_DIRECTORY/shed-env.out 2>&1
shed env >$OUTPUT_DIRECTORY/shed_env.out 2>&1

shed-list >$OUTPUT_DIRECTORY/shed-list.out 2>&1
shed list >$OUTPUT_DIRECTORY/shed_list.out 2>&1

shed-list-code >$OUTPUT_DIRECTORY/shed-list-code.out 2>&1
shed list-code >$OUTPUT_DIRECTORY/shed_list-code.out 2>&1

shed-values >$OUTPUT_DIRECTORY/shed-values.out 2>&1
shed values >$OUTPUT_DIRECTORY/shed_values.out 2>&1

shed-value-key-list >$OUTPUT_DIRECTORY/shed-value-key-list.out 2>&1
shed value-key-list >$OUTPUT_DIRECTORY/shed_value-key-list.out 2>&1

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

ALL_MAN_PAGES_5=(
    shed-config.yaml
)
for i in ${ALL_MAN_PAGES_5[@]}; do
    MANWIDTH=120 man -s 5 --pager=cat "$i" >$OUTPUT_DIRECTORY/man_${i}.out  2>&1
done
(
    source /usr/lib/shed/shed-init
    shed-use T
    shed-values > $OUTPUT_DIRECTORY/shed-values-T-0.out 2>&1
    shed-kubectl get po > $OUTPUT_DIRECTORY/shed-kubectl-get-po-T-0.out 2>&1
    shed-use D
    shed-values > $OUTPUT_DIRECTORY/shed-values-D-0.out 2>&1
    shed-kubectl get po > $OUTPUT_DIRECTORY/shed-kubectl-get-po-D-0.out 2>&1
    shed-kubeconfig-use 1
    shed-values > $OUTPUT_DIRECTORY/shed-values-D-1.out 2>&1
    shed-kubectl get po > $OUTPUT_DIRECTORY/shed-kubectl-get-po-D-1.out 2>&1
)