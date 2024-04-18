setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-exec-bash" {
    run shed kubectl-exec-bash
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-exec-bash xxx yyy zzz" {
    run shed kubectl-exec-bash xxx yyy zzz
    assert_success
    cat_expected "usage" | assert_output -
}
@test "shed kubectl-exec-bash xxx" {
    run shed kubectl-exec-bash xxx
    assert_failure 1
    cat_expected "invalid-pod-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; shed kubectl-exec-bash hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |shed kubectl-exec-bash say-hello "
    assert_success
    cat_expected "shed-kubectl-exec-bash" | assert_output -
    shed-kubectl-delete hello-world
}
