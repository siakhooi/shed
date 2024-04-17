setup(){
    load '../common-setup'
    common_setup
}
@test "k-logs-p" {
    run bash -ic 'k-logs-p'
    assert_success
    cat_expected "shed-kubectl-logs-previous-usage" | assert_output -
}
@test "k-logs-p xxx yyy zzz" {
    run bash -ic 'k-logs-p xxx yyy zzz'
    assert_success
    cat_expected "shed-kubectl-logs-previous-usage" | assert_output -
}
@test "k-logs-p xxx" {
    run bash -ic 'k-logs-p xxx'
    assert_failure 1
    cat_expected "shed-kubectl-logs-previous-xxx" | assert_output -
}
@test "shed-kubectl-apply pod-busybox-loop; k-logs-p pod-busybox-loop" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |k-logs-p busybox-looping "
    assert_success
    cat_expected "shed-kubectl-logs-previous" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
@test "shed-kubectl-apply pod-busybox-loop; k-logs-p pod-busybox-loop busybox-1" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |k-logs-p busybox-looping busybox-1"
    assert_success
    cat_expected "shed-kubectl-logs-previous-container" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}