setup(){
    load '../common-setup'
    common_setup
}
@test "ka" {
    skip "alias ka not working in testing environment"
    run ka
    assert_success
    cat_expected "shed-kubectl-apply-usage" | assert_output -e -
}
@test "ka xxx" {
    skip "alias ka not working in testing environment"
    run ka xxx
    assert_failure 1
    cat_expected "shed-kubectl-apply-resource-not-exists" | assert_output -
}
@test "ka pod-busybox-loop" {
    skip "alias ka not working in testing environment"
    run ka pod-busybox-loop
    assert_success
    cat_expected "shed-kubectl-apply" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
