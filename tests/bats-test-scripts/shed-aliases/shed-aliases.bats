setup(){
    load '../common-setup'
    common_setup
}
@test "shed-aliases" {
    run bash -i -c 'shed-aliases'
    cat_expected "shed-aliases" | assert_output -
}
