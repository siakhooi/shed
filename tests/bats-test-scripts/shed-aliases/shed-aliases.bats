setup(){
    load '../common-setup'
    common_setup
}
@test "shed-aliases" {
    skip "alias shed-aliases not working in test environment"
    run shed-aliases
    cat_expected "shed-aliases" | assert_output -
}
