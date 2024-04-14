setup(){
    load '../common-setup'
    common_setup
}
@test "shed-list" {
    run shed-list
    assert_success
    cat_expected "shed-list" | assert_output -
}
@test "shed list" {
    run shed list
    assert_success
    cat_expected "shed-list" | assert_output -
}
@test "shed-list xxx" {
    run shed-list xxx
    assert_success
    cat_expected "shed-list" | assert_output -
}
@test "shed list xxx" {
    run shed list xxx
    assert_success
    cat_expected "shed-list" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed-list" {
    unset SHED_CONFIG_FILE
    run shed-list
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed list" {
    unset SHED_CONFIG_FILE
    run shed list
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed-list" {
    SHED_CONFIG_FILE=/xxx
    run shed-list
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed list" {
    SHED_CONFIG_FILE=/xxx
    run shed list
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
