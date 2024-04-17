setup(){
    load '../common-setup'
    common_setup
}
@test "kd" {
    run bash -i -c 'kd'
    assert_success
    cat_expected "shed-kubectl-delete-usage" | assert_output -e -
}
@test "kd xxx" {
    run bash -i -c 'kd xxx'
    assert_failure 1
    cat_expected "shed-kubectl-delete-resource-not-exists" | assert_output -
}
@test "kd pod-busybox-loop" {
    shed-kubectl-apply pod-busybox-loop
    run bash -i -c 'kd pod-busybox-loop'
    assert_success
    cat_expected "shed-kubectl-delete" | assert_output -
}
