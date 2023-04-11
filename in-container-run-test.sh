#!/bin/bash

EXPECTED_DIRECTORY=test/expected
ACTUAL_DIRECTORY=$(mktemp -d)

## Testing start
shed-env > $ACTUAL_DIRECTORY/shed-env.out
shed env > $ACTUAL_DIRECTORY/shed_env.out
MANWIDTH=120 man --pager=cat shed-env > $ACTUAL_DIRECTORY/man_shed-env.out

shed-list > $ACTUAL_DIRECTORY/shed-list.out
shed list > $ACTUAL_DIRECTORY/shed_list.out
MANWIDTH=120 man --pager=cat shed-list > $ACTUAL_DIRECTORY/man_shed-list.out

shed-list-code > $ACTUAL_DIRECTORY/shed-list-code.out
shed list-code > $ACTUAL_DIRECTORY/shed_list-code.out
MANWIDTH=120 man --pager=cat shed-list-code > $ACTUAL_DIRECTORY/man_shed-list-code.out

shed-values > $ACTUAL_DIRECTORY/shed-values.out
shed values > $ACTUAL_DIRECTORY/shed_values.out
MANWIDTH=120 man --pager=cat shed-values > $ACTUAL_DIRECTORY/man_shed-values.out

shed-value-key-list > $ACTUAL_DIRECTORY/shed-value-key-list.out
shed value-key-list > $ACTUAL_DIRECTORY/shed_value-key-list.out
MANWIDTH=120 man --pager=cat shed-value-key-list > $ACTUAL_DIRECTORY/man_shed-value-key-list.out

MANWIDTH=120 man --pager=cat shed-kubectl-scale > $ACTUAL_DIRECTORY/man_shed-kubectl-scale.out
## Testing end

diff $EXPECTED_DIRECTORY $ACTUAL_DIRECTORY 

if [[ $? == 0 ]] ; then echo.green "Look good!"; else echo.red "Something wrong!" ; fi

echo.blue "Actual Result in: $ACTUAL_DIRECTORY"

ls -l "$ACTUAL_DIRECTORY"
