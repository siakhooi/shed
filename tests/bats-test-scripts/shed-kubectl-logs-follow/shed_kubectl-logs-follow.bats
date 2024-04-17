setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-logs-follow xxx" {
    run shed kubectl-logs-follow xxx
    assert_failure 1
    cat_expected "shed-kubectl-logs-follow-xxx" | assert_output -
}
@test "shed-kubectl-apply pod-busybox-loop; shed kubectl-logs-follow pod-busybox-loop" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |shed kubectl-logs-follow busybox-looping "
    assert_success
    cat_expected "shed-kubectl-logs-follow" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
