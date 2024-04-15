setup(){
    load '../common-setup'
    common_setup
}
@test "shed-use T; k get po" {
    skip "alias k is not working in test environment"
    shed-use T
    run k get po
    assert_success
    cat_expected "shed-kubectl-get-po-T-0" | assert_output -
}
@test "shed-use D; k get po" {
    skip "alias k is not working in test environment"
    shed-use D
    run k get po
    assert_success
    cat_expected "shed-kubectl-get-po-D-0" | assert_output -
}
@test "shed-use D; shed-kubeconfig-use 1; k get po" {
    skip "alias k is not working in test environment"
    shed-use D
    shed-kubeconfig-use 1
    run k get po
    assert_success
    cat_expected "shed-kubectl-get-po-D-1" | assert_output -
}
