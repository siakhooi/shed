setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-secret-decode" {
    run shed kubectl-secret-decode
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-secret-decode -h" {
    run shed kubectl-secret-decode -h
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-secret-decode xx xx" {
    run shed kubectl-secret-decode xx xx
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-secret-decode xxx" {
    run shed kubectl-secret-decode xxx
    assert_failure 1
    cat_expected "resource-not-exists" | assert_output -
}
@test "shed kubectl-secret-decode -f xxx" {
    run shed kubectl-secret-decode -f xxx
    assert_failure 1
    cat_expected "resource-not-exists" | assert_output -
}
@test "shed kubectl-secret-decode no-data" {
    shed-kubectl delete secrets/no-data --ignore-not-found=true
    shed-kubectl create secret generic no-data
    run shed kubectl-secret-decode no-data
    assert_failure 2
    cat_expected "no-data" | assert_output -
    shed-kubectl delete secrets/no-data
}
@test "shed kubectl-secret-decode many-data" {
    shed-kubectl delete secrets/many-data --ignore-not-found=true
    rm -rf many-data
    shed-kubectl create secret generic many-data --from-literal=key1=value1 --from-literal=superUserName=handsomeAdmin --from-literal=superPassword=DontCopyMe
    run shed kubectl-secret-decode many-data
    assert_success
    assert_file_not_exist "many-data/key1"
    assert_file_not_exist "many-data/superUserName"
    assert_file_not_exist "many-data/superPassword"
    cat_expected "many-data" | assert_output -
    shed-kubectl delete secrets/many-data
}
@test "shed kubectl-secret-decode -f many-data" {
    shed-kubectl delete secrets/many-data --ignore-not-found=true
    rm -rf many-data
    shed-kubectl create secret generic many-data --from-literal=key1=value1 --from-literal=superUserName=handsomeAdmin --from-literal=superPassword=DontCopyMe
    run shed kubectl-secret-decode -f many-data
    assert_success
    assert_file_exist "many-data/key1"
    assert_file_exist "many-data/superUserName"
    assert_file_exist "many-data/superPassword"
    cat_expected "many-data-files-created" | assert_output -
    shed-kubectl delete secrets/many-data
    rm -rf many-data
}
