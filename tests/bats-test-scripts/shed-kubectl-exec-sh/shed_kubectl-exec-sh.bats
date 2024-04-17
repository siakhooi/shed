setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-exec-sh xxx" {
    run shed kubectl-exec-sh xxx
    assert_failure 1
    cat_expected "shed-kubectl-exec-sh-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; shed kubectl-exec-sh hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |shed kubectl-exec-sh say-hello "
    assert_success
    cat_expected "shed-kubectl-exec-sh" | assert_output -
    shed-kubectl-delete hello-world
}
