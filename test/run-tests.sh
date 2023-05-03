#!/bin/bash

EXPECTED_DIRECTORY=test/expected
ACTUAL_DIRECTORY=$(mktemp -d)

if [[ $# -eq 1 ]] && [[ -d "$1" ]]; then
  ACTUAL_DIRECTORY=$1
fi

test/generate-test-output.sh "$ACTUAL_DIRECTORY"

diff -r $EXPECTED_DIRECTORY $ACTUAL_DIRECTORY

RESULT=$?
echo.blue "Actual Result in: $ACTUAL_DIRECTORY"

ls -l "$ACTUAL_DIRECTORY"

if [ $RESULT -eq 0 ]; then echo.green "Look good!"; else echo.red "Something wrong!"; fi

exit $RESULT
