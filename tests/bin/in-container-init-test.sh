#!/bin/bash

set -e

[[ -n $$WORKSPACE ]] && cd $WORKSPACE

PATH="$( ls -d /opt/istio*/bin ):$PATH"
export PATH

set -e
tests/bin/prepare-environments.sh
tests/bin/prepare-kind-clusters.sh
tests/bin/bats-test-run.sh
tests/bin/teardown-kind-clusters.sh
