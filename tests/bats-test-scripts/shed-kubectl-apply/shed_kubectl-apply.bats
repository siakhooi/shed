setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-apply" {
    run shed kubectl-apply
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-apply xxx yyy" {
    run shed kubectl-apply xxx yyy
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-apply xxx" {
    run shed kubectl-apply xxx
    assert_failure 1
    cat_expected "resource-not-exists" | assert_output -
}
@test "shed kubectl-apply hello-world" {
    run shed kubectl-apply hello-world
    assert_success
    cat_expected "shed-kubectl-apply" | assert_output -
    shed-kubectl-delete hello-world
    shed-kubectl wait --for delete pod --selector=app=hello-world --timeout 60s
}
@test "shed kubectl-apply hello-world-kustomize" {
    run shed kubectl-apply hello-world-kustomize
    assert_success
    cat_expected "shed-kubectl-apply-kustomize" | assert_output -
    shed-kubectl-delete hello-world-kustomize
    shed-kubectl wait --for delete pod --selector=app=hello-world-kustomize --timeout 60s
}
