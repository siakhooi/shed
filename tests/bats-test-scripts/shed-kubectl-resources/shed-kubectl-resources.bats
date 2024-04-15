setup(){
    load '../common-setup'
    common_setup
}
@test "shed-kubectl-resources" {
    run shed-kubectl-resources
    assert_success
    cat_expected "shed-kubectl-resources" | assert_output -
}
@test "shed kubectl-resources" {
    run shed kubectl-resources
    assert_success
    cat_expected "shed-kubectl-resources" | assert_output -
}
@test "shed-kubectl-resources xxx" {
    run shed-kubectl-resources xxx
    assert_success
    cat_expected "shed-kubectl-resources" | assert_output -
}
@test "shed kubectl-resources xxx" {
    run shed kubectl-resources xxx
    assert_success
    cat_expected "shed-kubectl-resources" | assert_output -
}
@test "unset SHED_CONFIG_DIRECTORY_RESOURCES; shed-kubectl-resources" {
    unset SHED_CONFIG_DIRECTORY_RESOURCES
    run shed-kubectl-resources
    assert_failure 1
    assert_output ""
}
@test "unset SHED_CONFIG_DIRECTORY_RESOURCES; shed kubectl-resources" {
    unset SHED_CONFIG_DIRECTORY_RESOURCES
    run shed kubectl-resources
    assert_failure 1
    assert_output ""
}
@test "SHED_CONFIG_DIRECTORY_RESOURCES=/xxx; shed-kubectl-resources" {
    SHED_CONFIG_DIRECTORY_RESOURCES=/xxx
    run shed-kubectl-resources
    assert_failure 1
    assert_output ""
}
@test "SHED_CONFIG_DIRECTORY_RESOURCES=/xxx; shed kubectl-resources" {
    SHED_CONFIG_DIRECTORY_RESOURCES=/xxx
    run shed kubectl-resources
    assert_failure 1
    assert_output ""
}
