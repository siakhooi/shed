setup(){
    load '../common-setup'
    common_setup
}
@test "shed value-key-list" {
    run shed value-key-list
    assert_success
    cat_expected "shed-value-key-list" | assert_output -
}
@test "shed value-key-list xxx" {
    run shed value-key-list xxx
    assert_success
    cat_expected "shed-value-key-list" | assert_output -
}
