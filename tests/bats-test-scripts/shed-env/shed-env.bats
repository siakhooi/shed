setup(){
    load '../common-setup'
    common_setup
}
@test "shed-env" {
    run shed-env
    cat_expected "shed-env" | assert_output -e -
}
@test "shed-env xxx" {
    run shed-env xxx
    cat_expected "shed-env" | assert_output -e -
}
@test "shed-use T; shed-env" {
    shed-use T
    run shed-env
    cat_expected "shed-env-shed-use-T" | assert_output -e -
}
@test "shed-kubeconfig-use 1; shed-env" {
    shed-kubeconfig-use 1
    run shed-env
    cat_expected "shed-env-c1" | assert_output -e -
}
@test "c1; shed-env" {
    run bash -ic 'c1; shed-env'
    cat_expected "shed-env-c1" | assert_output -e -
}
@test "bash -ic 'bash -ic shed-env'" {
    run bash -ic 'bash -ic shed-env'
    cat_expected "shed-env" | assert_output -e -
}
