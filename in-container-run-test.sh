#!/bin/bash

EXPECTED_DIRECTORY=test/expected
ACTUAL_DIRECTORY=$(mktemp -d)

## Testing start
shed-value-key-list > $ACTUAL_DIRECTORY/shed-value-key-list.out
shed value-key-list > $ACTUAL_DIRECTORY/shed_value-key-list.out
man --pager=cat shed-value-key-list > $ACTUAL_DIRECTORY/man_shed-value-key-list.out
## Testing end

diff $EXPECTED_DIRECTORY $ACTUAL_DIRECTORY 

if [[ $? == 0 ]] ; then echo.green "Look good!"; else echo.red "Something wrong!" ; fi

echo.blue "Actual Result in: $ACTUAL_DIRECTORY"

ls -l "$ACTUAL_DIRECTORY"

