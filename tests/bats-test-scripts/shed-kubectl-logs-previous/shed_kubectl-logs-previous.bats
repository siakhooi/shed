setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-logs-previous" {
    run shed kubectl-logs-previous
    assert_success
    cat_expected "shed-kubectl-logs-previous-usage" | assert_output -
}
@test "shed kubectl-logs-previous xxx yyy zzz" {
    run shed kubectl-logs-previous xxx yyy zzz
    assert_success
    cat_expected "shed-kubectl-logs-previous-usage" | assert_output -
}
@test "shed kubectl-logs-previous xxx" {
    run shed kubectl-logs-previous xxx
    assert_failure 1
    cat_expected "shed-kubectl-logs-previous-xxx" | assert_output -
}
@test "shed-kubectl-apply pod-busybox-loop; shed kubectl-logs-previous pod-busybox-loop" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |shed kubectl-logs-previous busybox-looping "
    assert_success
    cat_expected "shed-kubectl-logs-previous" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
@test "shed-kubectl-apply pod-busybox-loop; shed kubectl-logs-previous pod-busybox-loop busybox-1" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |shed kubectl-logs-previous busybox-looping busybox-1"
    assert_success
    cat_expected "shed-kubectl-logs-previous-container" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
