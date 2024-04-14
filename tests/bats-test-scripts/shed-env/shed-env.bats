setup(){
    load '../common-setup'
    common_setup

    outputExpected=$BATS_TEST_FILENAME.$BATS_TEST_DESCRIPTION.expected
}
@test "shed-env" {
    run bash -c "shed-env"
    assert_output - <$outputExpected
}