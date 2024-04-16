setup(){
    load '../common-setup'
    common_setup
}
@test "shed-helm list" {
    run shed-helm list
    cat_expected "shed-helm-list" | assert_output -
}
@test "shed helm list" {
    run shed helm list
    cat_expected "shed-helm-list" | assert_output -
}
@test "h list" {
    skip "alias h not working in test environment"
    run h list
    cat_expected "shed-helm-list" | assert_output -
}