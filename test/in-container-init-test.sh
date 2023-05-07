#!/bin/bash

source test/prepare-environments.sh

mkdir -p /working/test/actual-tests
rm -rf /working/test/actual-tests/*

chmod +x /working/test/run-tests.sh
/working/test/run-tests.sh /working/test/actual-tests
RESULT=$?
echo "result: $RESULT"
kind delete clusters kube-dev-1 kube-test-1
exit $RESULT
