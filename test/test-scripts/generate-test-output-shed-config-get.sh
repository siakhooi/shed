#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") outputDirectory"
    exit 0
fi
OUTPUT_DIRECTORY=$1
mkdir -p "$OUTPUT_DIRECTORY"

shed-config-get .shed-init.shed                    >$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].code                    >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].name                    >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].kubeconfig[0].context   >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].kubeconfig[0].namespace >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].kubeconfig[0].prompt-name >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].kubeconfig[1].context   >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[0].kubeconfig[1].namespace >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[1].code                    >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[1].name                    >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1
shed-config-get .sheds[1].kubeconfig[0].context   >>$OUTPUT_DIRECTORY/shed-config-get.out 2>&1

shed config-get .shed-init.shed                    >$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].code                    >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].name                    >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].kubeconfig[0].context   >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].kubeconfig[0].namespace >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].kubeconfig[0].prompt-name >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].kubeconfig[1].context   >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[0].kubeconfig[1].namespace >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[1].code                    >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[1].name                    >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
shed config-get .sheds[1].kubeconfig[0].context   >>$OUTPUT_DIRECTORY/shed_config-get.out 2>&1
