setup(){
    load '../common-setup'
    common_setup
}
@test "ka" {
    run bash -i -c 'ka'
    assert_success
    cat_expected "shed-kubectl-apply-usage" | assert_output -
}
@test "ka xxx" {
    run bash -i -c 'ka xxx'
    assert_failure 1
    cat_expected "shed-kubectl-apply-resource-not-exists" | assert_output -
}
@test "ka hello-world" {
    run bash -i -c 'ka hello-world'
    assert_success
    cat_expected "shed-kubectl-apply" | assert_output -
    shed-kubectl-delete hello-world
    shed-kubectl wait --for delete pod --selector=app=hello-world --timeout 60s
}
