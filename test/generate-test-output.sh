#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

## Testing start
shed-env > $OUTPUT_DIRECTORY/shed-env.out
shed env > $OUTPUT_DIRECTORY/shed_env.out
MANWIDTH=120 man --pager=cat shed-env > $OUTPUT_DIRECTORY/man_shed-env.out

shed-list > $OUTPUT_DIRECTORY/shed-list.out
shed list > $OUTPUT_DIRECTORY/shed_list.out
MANWIDTH=120 man --pager=cat shed-list > $OUTPUT_DIRECTORY/man_shed-list.out

shed-list-code > $OUTPUT_DIRECTORY/shed-list-code.out
shed list-code > $OUTPUT_DIRECTORY/shed_list-code.out
MANWIDTH=120 man --pager=cat shed-list-code > $OUTPUT_DIRECTORY/man_shed-list-code.out

shed-values > $OUTPUT_DIRECTORY/shed-values.out
shed values > $OUTPUT_DIRECTORY/shed_values.out
MANWIDTH=120 man --pager=cat shed-values > $OUTPUT_DIRECTORY/man_shed-values.out

shed-value-key-list > $OUTPUT_DIRECTORY/shed-value-key-list.out
shed value-key-list > $OUTPUT_DIRECTORY/shed_value-key-list.out
MANWIDTH=120 man --pager=cat shed-value-key-list > $OUTPUT_DIRECTORY/man_shed-value-key-list.out

MANWIDTH=120 man --pager=cat shed-kubectl-scale > $OUTPUT_DIRECTORY/man_shed-kubectl-scale.out
MANWIDTH=120 man --pager=cat shed-kubectl-logs-follow > $OUTPUT_DIRECTORY/man_shed-kubectl-logs-follow.out
## Testing end
