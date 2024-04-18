setup(){
    load '../common-setup'
    common_setup
}
@test "k-logs-p" {
    run bash -ic 'k-logs-p'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-logs-p xxx yyy zzz" {
    run bash -ic 'k-logs-p xxx yyy zzz'
    assert_success
    cat_expected "usage" | assert_output -
}
@test "k-logs-p xxx" {
    run bash -ic 'k-logs-p xxx'
    assert_failure 1
    cat_expected "invalid-pod-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; k-logs-p hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |k-logs-p say-hello "
    assert_success
    cat_expected "shed-kubectl-logs-previous" | assert_output -
    shed-kubectl-delete hello-world
}
@test "shed-kubectl-apply hello-world; k-logs-p hello-world busybox-1" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |k-logs-p say-hello busybox-1"
    assert_success
    cat_expected "shed-kubectl-logs-previous-container" | assert_output -
    shed-kubectl-delete hello-world
}
