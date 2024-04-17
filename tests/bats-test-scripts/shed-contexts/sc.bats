setup(){
    load '../common-setup'
    common_setup
}
@test "sc" {
    run bash -i -c 'sc'
    assert_success
    cat_expected "shed-contexts" | assert_output -
}
@test "sc xxx" {
    run bash -i -c 'sc xxx'
    assert_success
    cat_expected "shed-contexts" | assert_output -
}
@test "unset SHED_CONFIG_FILE; sc" {
    run bash -i -c 'unset SHED_CONFIG_FILE; sc'
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; sc" {
    run bash -i -c 'SHED_CONFIG_FILE=/xxx; sc'
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "unset SHED_CODE; sc" {
    run bash -i -c 'unset SHED_CODE; sc'
    assert_failure 3
    cat_expected "shed-code-not-set" | assert_output -
}
@test "SHED_CODE=NE; sc" {
    run bash -i -c 'SHED_CODE=NE; sc'
    assert_success
    cat_expected "shed-code-invalid" | assert_output -
}
