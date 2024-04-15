setup(){
    load '../common-setup'
    common_setup
}
@test "shed contexts" {
    run shed contexts
    assert_success
    cat_expected "shed-contexts" | assert_output -
}
@test "shed contexts xxx" {
    run shed contexts xxx
    assert_success
    cat_expected "shed-contexts" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed contexts" {
    unset SHED_CONFIG_FILE
    run shed contexts
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed contexts" {
    SHED_CONFIG_FILE=/xxx
    run shed contexts
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "unset SHED_CODE; shed contexts" {
    unset SHED_CODE
    run shed contexts
    assert_failure 3
    cat_expected "shed-code-not-set" | assert_output -
}
@test "SHED_CODE=NE; shed contexts" {
    SHED_CODE=NE
    run shed contexts
    assert_success
    cat_expected "shed-code-invalid" | assert_output -
}
