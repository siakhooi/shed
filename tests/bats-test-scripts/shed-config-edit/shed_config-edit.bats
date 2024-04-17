setup(){
    load '../common-setup'
    common_setup
}
@test "EDITOR=echo shed config-edit" {
    run bash -c 'EDITOR=echo shed config-edit'
    cat_expected "shed-config-edit-echo" | assert_output -
}
@test "EDITOR=cat shed config-edit" {
    run bash -c 'EDITOR=cat shed config-edit'
    cat_expected "shed-config-edit-cat" | assert_output -
}
