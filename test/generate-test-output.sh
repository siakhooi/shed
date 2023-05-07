#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

./test/test-scripts/generate-test-output-shed-env.sh               "$OUTPUT_DIRECTORY/shed-env"
./test/test-scripts/generate-test-output-shed-config.sh            "$OUTPUT_DIRECTORY/shed-config"
./test/test-scripts/generate-test-output-shed-list.sh              "$OUTPUT_DIRECTORY/shed-list"
./test/test-scripts/generate-test-output-shed-list-code.sh         "$OUTPUT_DIRECTORY/shed-list-code"
./test/test-scripts/generate-test-output-shed-values.sh            "$OUTPUT_DIRECTORY/shed-values"
./test/test-scripts/generate-test-output-shed-value-key-list.sh    "$OUTPUT_DIRECTORY/shed-value-key-list"

./test/test-scripts/generate-test-output-man1.sh "$OUTPUT_DIRECTORY/man1"
./test/test-scripts/generate-test-output-man5.sh "$OUTPUT_DIRECTORY/man5"

./test/test-scripts/generate-test-output-shed-kubectl.sh    "$OUTPUT_DIRECTORY/shed-kubectl"
