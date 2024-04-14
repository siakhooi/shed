#!/bin/bash

set -e

[[ -n $$WORKSPACE ]] && cd $WORKSPACE

tests/bin/prepare-environments.sh
tests/bin/prepare-kind-clusters.sh

tests/bin/bats-test-run.sh

tests/bin/teardown-kind-clusters.sh
