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
@test "EDITOR=xxx shed config-edit" {
    run -127 bash -c 'EDITOR=xxx shed config-edit'
    cat_expected "shed-config-edit-xxx" | assert_output -
}
@test "EDITOR='cat -n' shed config-edit" {
    run bash -c 'EDITOR="cat -n" shed config-edit'
    cat_expected "shed-config-edit-cat-n" | assert_output -
}
