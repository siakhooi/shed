setup(){
    load '../common-setup'
    common_setup
}
@test "ka" {
    run bash -i -c 'ka'
    assert_success
    cat_expected "shed-kubectl-apply-usage" | assert_output -e -
}
@test "ka xxx" {
    run bash -i -c 'ka xxx'
    assert_failure 1
    cat_expected "shed-kubectl-apply-resource-not-exists" | assert_output -
}
@test "ka pod-busybox-loop" {
    run bash -i -c 'ka pod-busybox-loop'
    assert_success
    cat_expected "shed-kubectl-apply" | assert_output -
    shed-kubectl-delete pod-busybox-loop
}
