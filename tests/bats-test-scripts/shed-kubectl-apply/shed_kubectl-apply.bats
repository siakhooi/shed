setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-apply" {
    run shed kubectl-apply
    assert_success
    cat_expected "shed-kubectl-apply-usage" | assert_output -e -
}
@test "shed kubectl-apply xxx" {
    run shed kubectl-apply xxx
    assert_failure 1
    cat_expected "shed-kubectl-apply-resource-not-exists" | assert_output -
}
@test "shed kubectl-apply pod-busybox-loop" {
    run shed kubectl-apply pod-busybox-loop
    assert_success
    cat_expected "shed-kubectl-apply" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
