setup(){
    load '../common-setup'
    common_setup
}
@test "c0" {
    run bash -i -c 'shed-use D; c0; echo $SHED_KUBECONFIG_NUMBER'
    echo "0" | assert_output -
}
@test "c1" {
    run bash -i -c 'shed-use D; c1; echo $SHED_KUBECONFIG_NUMBER'
    echo "1" | assert_output -
}
@test "c2" {
    run bash -i -c 'shed-use D; c2'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "c3" {
    run bash -i -c 'shed-use D; c3'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "c4" {
    run bash -i -c 'shed-use D; c4'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
