setup(){
    load '../common-setup'
    common_setup
}
@test "shed-use T; k get po" {
    run bash -i -c 'shed-use T; SHED_BASH_DEBUG_MODE_OFF=Y k get po'
    assert_success
    cat_expected "debug-mode-off-shed-kubectl-get-po-T-0" | assert_output -
}
@test "shed-use D; k get po" {
    run bash -i -c 'shed-use D; SHED_BASH_DEBUG_MODE_OFF=Y k get po'
    assert_success
    cat_expected "debug-mode-off-shed-kubectl-get-po-D-0" | assert_output -
}
@test "shed-use D; shed-kubeconfig-use 1; k get po" {
    run bash -i -c 'shed-use D; shed-kubeconfig-use 1; SHED_BASH_DEBUG_MODE_OFF=Y k get po'
    assert_success
    cat_expected "debug-mode-off-shed-kubectl-get-po-D-1" | assert_output -
}
