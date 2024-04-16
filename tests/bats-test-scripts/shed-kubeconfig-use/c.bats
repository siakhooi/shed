setup(){
    load '../common-setup'
    common_setup
}
@test "c0" {
    skip "alias c0 is not working in test environment"
    shed-use D
    c0
    run echo $SHED_KUBECONFIG_NUMBER
    echo "1" | assert_output -
}
@test "c1" {
    skip "alias c1 is not working in test environment"
    shed-use D
    c1
    run echo $SHED_KUBECONFIG_NUMBER
    echo "1" | assert_output -
}
@test "c2" {
    skip "alias c2 is not working in test environment"
    shed-use D
    run c2
    cat_expected "kubeconfig-number-not-setup" | assert_output -
}
@test "c3" {
    skip "alias c3 is not working in test environment"
    shed-use D
    run c3
    cat_expected "kubeconfig-number-not-setup" | assert_output -
}
@test "c4" {
    skip "alias c4 is not working in test environment"
    shed-use D
    run c4
    cat_expected "kubeconfig-number-not-setup" | assert_output -
}
