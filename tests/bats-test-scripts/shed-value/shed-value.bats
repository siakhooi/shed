setup(){
    load '../common-setup'
    common_setup
}
@test "shed-value .code" {
    run shed-value .code
    echo "D" | assert_output -
}
@test "shed-value .name" {
    run shed-value .name
    echo "shed-D-development" | assert_output -
}
@test "shed-value .kubeconfig[0].context" {
    run shed-value .kubeconfig[0].context
    echo "kube-dev-1" | assert_output -
}
@test "shed-value .kubeconfig[0].namespace" {
    run shed-value .kubeconfig[0].namespace
    echo "ns-application" | assert_output -
}
@test "shed-value .kubeconfig[0].prompt-name" {
    run shed-value .kubeconfig[0].prompt-name
    echo "dev-app" | assert_output -
}
@test "shed-value .kubeconfig[1].context" {
    run shed-value .kubeconfig[1].context
    echo "kube-dev-1" | assert_output -
}
@test "shed-value .kubeconfig[1].namespace" {
    run shed-value .kubeconfig[1].namespace
    echo "ns-database" | assert_output -
}
@test "shed-value .a.b.c.d" {
    run shed-value .a.b.c.d
    assert_output ""
}
@test "shed-value xxxxx" {
    run shed-value xxxxxx
    cat_expected "invalid-input" |assert_output -
}
