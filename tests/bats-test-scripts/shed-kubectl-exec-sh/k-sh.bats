setup(){
    load '../common-setup'
    common_setup
}
@test "k-sh xxx" {
    run bash -ic 'k-sh xxx'
    assert_failure 1
    cat_expected "shed-kubectl-exec-sh-xxx" | assert_output -
}
@test "shed-kubectl-apply pod-busybox-loop; k-sh pod-busybox-loop" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply pod-busybox-loop
    run bash -ic "echo 'exit' |k-sh busybox-looping "
    assert_success
    cat_expected "shed-kubectl-exec-sh" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
