setup(){
    load '../common-setup'
    common_setup
}
@test "shed-use T; shed kubectl get po" {
    shed-use T
    export SHED_BASH_DEBUG_MODE_OFF=Y
    run shed kubectl get po
    assert_success
    cat_expected "debug-mode-off-shed-kubectl-get-po-T-0" | assert_output -
}
@test "shed-use D; shed kubectl get po" {
    shed-use D
    export SHED_BASH_DEBUG_MODE_OFF=Y
    run shed kubectl get po
    assert_success
    cat_expected "debug-mode-off-shed-kubectl-get-po-D-0" | assert_output -
}
@test "shed-use D; shed-kubeconfig-use 1; shed kubectl get po" {
    shed-use D
    shed-kubeconfig-use 1
    export SHED_BASH_DEBUG_MODE_OFF=Y
    run shed kubectl get po
    assert_success
    cat_expected "debug-mode-off-shed-kubectl-get-po-D-1" | assert_output -
}
