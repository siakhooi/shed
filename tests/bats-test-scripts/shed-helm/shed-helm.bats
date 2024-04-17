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
    run bash -i -c 'h list'
    cat_expected "shed-helm-list" | assert_output -
}