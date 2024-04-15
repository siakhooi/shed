setup(){
    load '../common-setup'
    common_setup
}
@test "shed-use T; shed-kubectl get po" {
    shed-use T
    run shed-kubectl get po
    assert_success
    cat_expected "shed-kubectl-get-po-T-0" | assert_output -
}
@test "shed-use D; shed-kubectl get po" {
    shed-use D
    run shed-kubectl get po
    assert_success
    cat_expected "shed-kubectl-get-po-D-0" | assert_output -
}
@test "shed-use D; shed-kubeconfig-use 1; shed-kubectl get po" {
    shed-use D
    shed-kubeconfig-use 1
    run shed-kubectl get po
    assert_success
    cat_expected "shed-kubectl-get-po-D-1" | assert_output -
}
