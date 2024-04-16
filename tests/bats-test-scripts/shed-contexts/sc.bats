setup(){
    load '../common-setup'
    common_setup
}
@test "sc" {
    skip "alias sc is not working in testing environment"
    run sc
    assert_success
    cat_expected "shed-contexts" | assert_output -
}
@test "sc xxx" {
    skip "alias sc is not working in testing environment"
    run sc xxx
    assert_success
    cat_expected "shed-contexts" | assert_output -
}
@test "unset SHED_CONFIG_FILE; sc" {
    skip "alias sc is not working in testing environment"
    unset SHED_CONFIG_FILE
    run sc
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; sc" {
    skip "alias sc is not working in testing environment"
    SHED_CONFIG_FILE=/xxx
    run sc
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "unset SHED_CODE; sc" {
    skip "alias sc is not working in testing environment"
    unset SHED_CODE
    run sc
    assert_failure 3
    cat_expected "shed-code-not-set" | assert_output -
}
@test "SHED_CODE=NE; sc" {
    skip "alias sc is not working in testing environment"
    SHED_CODE=NE
    run sc
    assert_success
    cat_expected "shed-code-invalid" | assert_output -
}
