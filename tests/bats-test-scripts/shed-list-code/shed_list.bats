setup(){
    load '../common-setup'
    common_setup
}
@test "shed list-code" {
    run shed list-code
    assert_success
    cat_expected "shed-list-code" | assert_output -
}
@test "shed list-code xxx" {
    run shed list-code xxx
    assert_success
    cat_expected "shed-list-code" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed list-code" {
    unset SHED_CONFIG_FILE
    run shed list-code
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed list-code" {
    SHED_CONFIG_FILE=/xxx
    run shed list-code
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
