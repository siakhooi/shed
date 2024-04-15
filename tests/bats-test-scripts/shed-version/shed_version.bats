setup(){
    load '../common-setup'
    common_setup
}
@test "shed version" {
    run shed version
    assert_success
    cat_expected "shed-version" | assert_output -e -
}
@test "shed version xxx" {
    run shed version xxx
    assert_success
    cat_expected "shed-version" | assert_output -e -
}
