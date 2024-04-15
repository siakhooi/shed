setup(){
    load '../common-setup'
    common_setup
}
@test "shed xxx" {
    run shed xxx
    assert_failure 3
    cat_expected "shed-unsupported-module" | assert_output -
}
