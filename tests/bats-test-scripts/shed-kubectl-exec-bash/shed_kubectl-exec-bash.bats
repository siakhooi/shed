setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-exec-bash xxx" {
    run shed kubectl-exec-bash xxx
    assert_failure 1
    cat_expected "shed-kubectl-exec-bash-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; shed kubectl-exec-bash hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |shed kubectl-exec-bash say-hello "
    assert_success
    cat_expected "shed-kubectl-exec-bash" | assert_output -
    shed-kubectl-delete hello-world
}
