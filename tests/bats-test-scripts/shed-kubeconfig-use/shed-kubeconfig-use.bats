setup(){
    load '../common-setup'
    common_setup
}
@test "shed-kubeconfig-use 0" {
    shed-use D
    shed-kubeconfig-use 0
    assert_equal $SHED_KUBECONFIG_NUMBER "0"
}
@test "shed-kubeconfig-use 1" {
    shed-use D
    shed-kubeconfig-use 1
    assert_equal $SHED_KUBECONFIG_NUMBER "1"
}
@test "shed-kubeconfig-use 2" {
    shed-use D
    run shed-kubeconfig-use 2
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 3" {
    shed-use D
    run shed-kubeconfig-use 3
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 4" {
    shed-use D
    run shed-kubeconfig-use 4
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 5" {
    shed-use D
    run shed-kubeconfig-use 5
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 6" {
    shed-use D
    run shed-kubeconfig-use 6
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 7" {
    shed-use D
    run shed-kubeconfig-use 7
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 8" {
    shed-use D
    run shed-kubeconfig-use 8
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 9" {
    shed-use D
    run shed-kubeconfig-use 9
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "shed-kubeconfig-use 10" {
    shed-use D
    run shed-kubeconfig-use 10
    cat_expected "invalid-kubeconfig-number" | assert_output -e -
}
@test "shed-kubeconfig-use A" {
    shed-use D
    run shed-kubeconfig-use A
    cat_expected "invalid-kubeconfig-number" | assert_output -e -
}
@test "shed-kubeconfig-use" {
    shed-use D
    run shed-kubeconfig-use
    cat_expected "show-shed-kubeconfig-use-usage" | assert_output -
}
@test "shed-kubeconfig-use 6 7" {
    shed-use D
    run shed-kubeconfig-use 6 7
    cat_expected "show-shed-kubeconfig-use-usage" | assert_output -
}