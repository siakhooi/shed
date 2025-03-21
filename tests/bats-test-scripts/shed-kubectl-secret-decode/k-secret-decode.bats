setup(){
    load '../common-setup'
    common_setup
}
@test "k-secret-decode" {
    run bash -i -c 'k-secret-decode'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-secret-decode -h" {
    run bash -i -c 'k-secret-decode -h'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-secret-decode xx xx" {
    run bash -i -c 'k-secret-decode xx xx'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-secret-decode xxx" {
    run bash -i -c 'k-secret-decode xxx'
    assert_failure 1
    cat_expected "resource-not-exists" | assert_output -
}
@test "k-secret-decode -f xxx" {
    run bash -i -c 'k-secret-decode -f xxx'
    assert_failure 1
    cat_expected "resource-not-exists" | assert_output -
}
@test "k-secret-decode no-data" {
    shed-kubectl delete secrets/no-data --ignore-not-found=true
    shed-kubectl create secret generic no-data
    run bash -i -c 'k-secret-decode no-data'
    assert_failure 2
    cat_expected "no-data" | assert_output -
    shed-kubectl delete secrets/no-data
}
@test "k-secret-decode many-data" {
    shed-kubectl delete secrets/many-data --ignore-not-found=true
    rm -rf many-data
    shed-kubectl create secret generic many-data --from-literal=key1=value1 --from-literal=superUserName=handsomeAdmin --from-literal=superPassword=DontCopyMe
    run bash -i -c 'k-secret-decode many-data'
    assert_success
    assert_file_not_exist "many-data/key1"
    assert_file_not_exist "many-data/superUserName"
    assert_file_not_exist "many-data/superPassword"
    cat_expected "many-data" | assert_output -
    shed-kubectl delete secrets/many-data
}
@test "k-secret-decode -f many-data" {
    shed-kubectl delete secrets/many-data --ignore-not-found=true
    rm -rf many-data
    shed-kubectl create secret generic many-data --from-literal=key1=value1 --from-literal=superUserName=handsomeAdmin --from-literal=superPassword=DontCopyMe
    run bash -i -c 'k-secret-decode -f many-data'
    assert_success
    assert_file_exist "many-data/key1"
    assert_file_exist "many-data/superUserName"
    assert_file_exist "many-data/superPassword"
    cat_expected "many-data-files-created" | assert_output -
    shed-kubectl delete secrets/many-data
    rm -rf many-data
}
