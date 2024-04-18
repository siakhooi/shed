setup(){
    load '../common-setup'
    common_setup
}
@test "shed-use KKK" {
    run shed-use KKK
    cat_expected "invalid-shed-code" | assert_output -
}
@test "shed-use" {
    run shed-use
    cat_expected "usage" | assert_output -
}
@test "shed-use xxx yyy" {
    run shed-use xxx yyy
    cat_expected "usage" | assert_output -
}
