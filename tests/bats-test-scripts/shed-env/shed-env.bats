setup(){
    load '../common-setup'
    common_setup

    outputExpected=$BATS_TEST_FILENAME.$BATS_TEST_DESCRIPTION.expected
}
@test "shed-env" {
    run shed-env
    assert_output - <$outputExpected
}
@test "shed-env-to-T" {
    shed-use T
    run shed-env
    assert_output - <$outputExpected
}
@test "shed-env-to-shed-kubeconfig-use-1" {
    shed-kubeconfig-use 1
    run shed-env
    assert_output - <$outputExpected
}
@test "shed-env-to-c1" {
    skip "alias c1 not working in test environment"
    c1
    run shed-env
    assert_output - <$outputExpected
}
