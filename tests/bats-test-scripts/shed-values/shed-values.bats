setup(){
    load '../common-setup'
    common_setup
}
@test "shed-values" {
    run shed-values
    assert_success
    cat_expected "shed-values" | assert_output -
}
@test "shed values" {
    run shed values
    assert_success
    cat_expected "shed-values" | assert_output -
}
@test "shed-values xxx" {
    run shed-values xxx
    assert_success
    cat_expected "shed-values" | assert_output -
}
@test "shed values xxx" {
    run shed values xxx
    assert_success
    cat_expected "shed-values" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed-values" {
    unset SHED_CONFIG_FILE
    run shed-values
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "unset SHED_CONFIG_FILE; shed values" {
    unset SHED_CONFIG_FILE
    run shed values
    assert_failure 1
    cat_expected "shed-config-file-not-set" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed-values" {
    SHED_CONFIG_FILE=/xxx
    run shed-values
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "SHED_CONFIG_FILE=/xxx; shed values" {
    SHED_CONFIG_FILE=/xxx
    run shed values
    assert_failure 2
    cat_expected "shed-config-file-not-found" | assert_output -
}
@test "unset SHED_CODE; shed-values" {
    unset SHED_CODE
    run shed-values
    assert_failure 3
    cat_expected "shed-code-not-set" | assert_output -
}
@test "unset SHED_CODE; shed values" {
    unset SHED_CODE
    run shed values
    assert_failure 3
    cat_expected "shed-code-not-set" | assert_output -
}
@test "SHED_CODE=NE; shed-values" {
    SHED_CODE=NE
    run shed-values
    assert_success
    assert_output ""
}
@test "SHED_CODE=NE; shed values" {
    SHED_CODE=NE
    run shed values
    assert_success
    assert_output ""
}
