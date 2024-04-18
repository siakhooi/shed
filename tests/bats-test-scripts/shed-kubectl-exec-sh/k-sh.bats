setup(){
    load '../common-setup'
    common_setup
}
@test "k-sh" {
    run bash -ic 'k-sh'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-sh xxx yyy zzz" {
    run bash -ic 'k-sh xxx yyy zzz'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-sh xxx" {
    run bash -ic 'k-sh xxx'
    assert_failure 1
    cat_expected "invalid-pod-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; k-sh hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |k-sh say-hello "
    assert_success
    cat_expected "shed-kubectl-exec-sh" | assert_output -
    shed-kubectl-delete hello-world
}
