setup(){
    load '../common-setup'
    common_setup
}
@test "shed-config" {
    run shed-config
    assert_success
    cat_expected "shed-config" | assert_output -
}
@test "shed config" {
    run shed config
    assert_success
    cat_expected "shed-config" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed-config" {
    unset SHED_CONFIG_FILE
    run shed-config
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed config" {
    unset SHED_CONFIG_FILE
    run shed config
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed-config" {
    SHED_CONFIG_FILE=/xxx
    run shed-config
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed config" {
    SHED_CONFIG_FILE=/xxx
    run shed config
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
