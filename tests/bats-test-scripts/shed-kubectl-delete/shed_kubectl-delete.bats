setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-delete" {
    run shed kubectl-delete
    assert_success
    cat_expected "shed-kubectl-delete-usage" | assert_output -e -
}
@test "shed kubectl-delete xxx" {
    run shed kubectl-delete xxx
    assert_failure 1
    cat_expected "shed-kubectl-delete-resource-not-exists" | assert_output -
}
@test "shed kubectl-delete pod-busybox-loop" {
    shed kubectl-apply pod-busybox-loop
    run shed kubectl-delete pod-busybox-loop
    assert_success
    cat_expected "shed-kubectl-delete" | assert_output -
}
