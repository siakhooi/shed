setup(){
    load '../common-setup'
    common_setup
}
@test "kd" {
    run bash -i -c 'kd'
    assert_success
    cat_expected "shed-kubectl-delete-usage" | assert_output -
}
@test "kd xxx" {
    run bash -i -c 'kd xxx'
    assert_failure 1
    cat_expected "shed-kubectl-delete-resource-not-exists" | assert_output -
}
@test "kd hello-world" {
    shed-kubectl-apply hello-world
    run bash -i -c 'kd hello-world'
    assert_success
    cat_expected "shed-kubectl-delete" | assert_output -
    shed-kubectl wait --for delete pod --selector=app=hello-world --timeout 60s
}
