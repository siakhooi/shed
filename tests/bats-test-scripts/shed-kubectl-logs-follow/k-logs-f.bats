setup(){
    load '../common-setup'
    common_setup
}
@test "k-logs-f xxx" {
    run bash -ic 'k-logs-f xxx'
    assert_failure 1
    cat_expected "shed-kubectl-logs-follow-xxx" | assert_output -
}
@test "shed-kubectl-apply pod-busybox-loop; k-logs-f pod-busybox-loop" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |k-logs-f busybox-looping "
    assert_success
    cat_expected "shed-kubectl-logs-follow" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
