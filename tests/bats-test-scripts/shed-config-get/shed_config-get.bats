setup(){
    load '../common-setup'
    common_setup
}
@test "shed config-get" {
    run shed config-get
    cat_expected "usage" |assert_output -
}
@test "shed config-get .xxx .yyy" {
    run shed config-get xxx yyy
    cat_expected "usage" |assert_output -
}
@test "shed config-get .shed-init.shed" {
    run shed config-get .shed-init.shed
    echo "D" | assert_output -
}
@test "shed config-get .sheds[0].code" {
    run shed config-get .sheds[0].code
    echo "D" | assert_output -
}
@test "shed config-get .sheds[0].name" {
    run shed config-get .sheds[0].name
    echo "shed-D-development" | assert_output -
}
@test "shed config-get .sheds[0].kubeconfig[0].context" {
    run shed config-get .sheds[0].kubeconfig[0].context
    echo "kube-dev-1" | assert_output -
}
@test "shed config-get .sheds[0].kubeconfig[0].namespace" {
    run shed config-get .sheds[0].kubeconfig[0].namespace
    echo "ns-application" | assert_output -
}
@test "shed config-get .sheds[0].kubeconfig[0].prompt-name" {
    run shed config-get .sheds[0].kubeconfig[0].prompt-name
    echo "dev-app" | assert_output -
}
@test "shed config-get .sheds[0].kubeconfig[1].context" {
    run shed config-get .sheds[0].kubeconfig[1].context
    echo "kube-dev-1" | assert_output -
}
@test "shed config-get .sheds[0].kubeconfig[1].namespace" {
    run shed config-get .sheds[0].kubeconfig[1].namespace
    echo "ns-database" | assert_output -
}
@test "shed config-get .sheds[1].code" {
    run shed config-get .sheds[1].code
    echo "T" | assert_output -
}
@test "shed config-get .sheds[1].name" {
    run shed config-get .sheds[1].name
    echo "shed-T-testing" | assert_output -
}
@test "shed config-get .sheds[1].kubeconfig[0].context" {
    run shed config-get .sheds[1].kubeconfig[0].context
    echo "kube-test-1" | assert_output -
}
@test "shed config-get .a.b.c.d" {
    run shed config-get .a.b.c.d
    assert_output ""
}
@test "shed config-get xxxxx" {
    run shed config-get xxxxxx
    cat_expected "invalid-input" |assert_output -
}
