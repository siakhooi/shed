setup(){
    load '../common-setup'
    common_setup
}
@test "k-bash" {
    run bash -ic 'k-bash'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-bash xxx yyy zzz" {
    run bash -ic 'k-bash xxx yyy zzz'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-bash xxx" {
    run bash -ic 'k-bash xxx'
    assert_failure 1
    cat_expected "shed-kubectl-exec-bash-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; k-bash hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |k-bash say-hello "
    assert_success
    cat_expected "shed-kubectl-exec-bash" | assert_output -
    shed-kubectl-delete hello-world
}
