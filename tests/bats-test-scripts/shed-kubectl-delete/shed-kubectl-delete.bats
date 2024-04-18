setup(){
    load '../common-setup'
    common_setup
}
@test "shed-kubectl-delete" {
    run shed-kubectl-delete
    assert_success
    cat_expected "shed-kubectl-delete-usage" | assert_output -
}
@test "shed-kubectl-delete xxx yyy" {
    run shed-kubectl-delete xxx yyy
    assert_success
    cat_expected "shed-kubectl-delete-usage" | assert_output -
}
@test "shed-kubectl-delete xxx" {
    run shed-kubectl-delete xxx
    assert_failure 1
    cat_expected "shed-kubectl-delete-resource-not-exists" | assert_output -
}
@test "shed-kubectl-delete hello-world" {
    shed kubectl-apply hello-world
    run shed-kubectl-delete hello-world
    assert_success
    cat_expected "shed-kubectl-delete" | assert_output -
    shed-kubectl wait --for delete pod --selector=app=hello-world --timeout 60s
}
