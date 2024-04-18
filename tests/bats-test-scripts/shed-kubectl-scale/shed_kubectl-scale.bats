setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-scale" {
    run shed kubectl-scale
    assert_success
    cat_expected "shed-kubectl-scale-usage" | assert_output -
}
@test "shed kubectl-scale xxx" {
    run shed kubectl-scale xxx
    assert_success
    cat_expected "shed-kubectl-scale-usage" | assert_output -
}
@test "shed kubectl-scale 2 hello-world-scalable" {
    shed-kubectl-apply hello-world-scalable
    run shed kubectl-scale 2 deployments/hello-world-scalable
    assert_success
    cat_expected "shed-kubectl-scale" | assert_output -
    shed-kubectl delete deployments/hello-world-scalable
    shed-kubectl wait --for delete pod --selector=app=hello-world-scalable --timeout 60s
}
