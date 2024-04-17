setup(){
    load '../common-setup'
    common_setup
}
@test "shed-istioctl profile list" {
    run shed-istioctl profile list
    cat_expected "shed-istioctl-profile-list" | assert_output -
}
@test "shed istioctl profile list" {
    run shed istioctl profile list
    cat_expected "shed-istioctl-profile-list" | assert_output -
}
@test "i profile list" {
    run bash -i -c 'i profile list'
    cat_expected "shed-istioctl-profile-list" | assert_output -
}