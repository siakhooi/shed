#!/bin/bash

source test/prepare-environments.sh
source test/prepare-kind-clusters.sh

mkdir -p /working/test/actual-tests
rm -rf /working/test/actual-tests/*

chmod +x /working/test/run-tests.sh
/working/test/run-tests.sh /working/test/actual-tests
RESULT=$?
echo "result: $RESULT"

source test/teardown-kind-clusters.sh

exit $RESULT
