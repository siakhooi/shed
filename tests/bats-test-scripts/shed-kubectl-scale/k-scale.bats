setup(){
    load '../common-setup'
    common_setup
}
@test "k-scale" {
    run bash -ic 'k-scale'
    assert_success
    cat_expected "shed-kubectl-scale-usage" | assert_output -
}
@test "k-scale xxx" {
    run bash -ic 'k-scale xxx'
    assert_success
    cat_expected "shed-kubectl-scale-usage" | assert_output -
}
@test "k-scale 2 hello-world-scalable" {
    shed-kubectl-apply hello-world-scalable
    run bash -ic 'k-scale 2 deployments/hello-world-scalable'
    assert_success
    cat_expected "shed-kubectl-scale" | assert_output -
    shed-kubectl delete deployments/hello-world-scalable
    shed-kubectl wait --for delete pod --selector=app=hello-world-scalable --timeout 60s
}
