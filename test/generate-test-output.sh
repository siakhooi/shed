#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

./test/generate-test-output-shed-env.sh               "$OUTPUT_DIRECTORY/shed-env"
./test/generate-test-output-shed-list.sh              "$OUTPUT_DIRECTORY/shed-list"
./test/generate-test-output-shed-list-code.sh         "$OUTPUT_DIRECTORY/shed-list-code"
./test/generate-test-output-shed-values.sh            "$OUTPUT_DIRECTORY/shed-values"
./test/generate-test-output-shed-value-key-list.sh    "$OUTPUT_DIRECTORY/shed-value-key-list"

./test/generate-test-output-man1.sh "$OUTPUT_DIRECTORY/man1"
./test/generate-test-output-man5.sh "$OUTPUT_DIRECTORY/man5"

./test/generate-test-output-shed-kubectl.sh    "$OUTPUT_DIRECTORY/shed-kubectl"
