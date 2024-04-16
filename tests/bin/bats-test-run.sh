#!/usr/bin/env bash

testPath=bats-test-scripts
if [[ $# -eq 1 ]]; then
   testPath=$testPath/$1
fi

SOURCE_BIN=$(pwd)/src/bin
export SOURCE_BIN

TEST_RUN_NUMBER=$(date +%Y%m%d%H%M%S)

cd tests
BATS_HELPER=../../../../test_helper
export BATS_HELPER

bats -r -T $testPath | tee bats-test-result-${TEST_RUN_NUMBER}.log 2>&1
