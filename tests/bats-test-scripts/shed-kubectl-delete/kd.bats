setup(){
    load '../common-setup'
    common_setup
}
@test "kd" {
    skip "alias kd not working in testing environment"
    run kd
    assert_success
    cat_expected "shed-kubectl-delete-usage" | assert_output -e -
}
@test "kd xxx" {
    skip "alias kd not working in testing environment"
    run kd xxx
    assert_failure 1
    cat_expected "shed-kubectl-delete-resource-not-exists" | assert_output -
}
@test "kd pod-busybox-loop" {
    skip "alias kd not working in testing environment"
    ka pod-busybox-loop
    run kd pod-busybox-loop
    assert_success
    cat_expected "shed-kubectl-delete" | assert_output -
}
