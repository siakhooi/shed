setup(){
    load '../common-setup'
    common_setup
}
@test "k-secret-decode" {
    skip "Alias k-secret-decode is not working in testing environment"
    run k-secret-decode
    assert_success
    cat_expected "shed-kubectl-secret-decode-usage" | assert_output -e -
}
@test "k-secret-decode xxx" {
    skip "Alias k-secret-decode is not working in testing environment"
    run k-secret-decode xxx
    assert_failure 1
    cat_expected "shed-kubectl-secret-decode-resource-not-exists" | assert_output -
}
@test "k-secret-decode no-data" {
    skip "Alias k-secret-decode is not working in testing environment"
    shed-kubectl delete secrets/no-data --ignore-not-found=true
    shed-kubectl create secret generic no-data
    run k-secret-decode no-data
    assert_failure 2
    cat_expected "shed-kubectl-secret-decode-no-data" | assert_output -
    shed-kubectl delete secrets/no-data
}
@test "k-secret-decode many-data" {
    skip "Alias k-secret-decode is not working in testing environment"
    shed-kubectl delete secrets/many-data --ignore-not-found=true
    shed-kubectl create secret generic many-data --from-literal=key1=value1 --from-literal=superUserName=handsomeAdmin --from-literal=superPassword=DontCopyMe
    run k-secret-decode many-data
    assert_success
    cat_expected "shed-kubectl-secret-decode-many-data" | assert_output -
    shed-kubectl delete secrets/many-data
}
