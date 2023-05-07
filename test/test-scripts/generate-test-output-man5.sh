#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

ALL_MAN_PAGES_5=(
    shed-config.yaml
)
for i in ${ALL_MAN_PAGES_5[@]}; do
    MANWIDTH=120 man -s 5 --pager=cat "$i" >$OUTPUT_DIRECTORY/man_${i}.out  2>&1
done
