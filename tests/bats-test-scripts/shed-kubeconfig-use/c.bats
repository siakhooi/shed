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
@test "c5" {
    run bash -i -c 'shed-use D; c5'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "c6" {
    run bash -i -c 'shed-use D; c6'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "c7" {
    run bash -i -c 'shed-use D; c7'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "c8" {
    run bash -i -c 'shed-use D; c8'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
@test "c9" {
    run bash -i -c 'shed-use D; c9'
    cat_expected "kubeconfig-number-not-setup" | assert_output -e -
}
