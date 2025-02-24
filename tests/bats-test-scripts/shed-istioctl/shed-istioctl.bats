setup(){
    load '../common-setup'
    common_setup
}
@test "shed-istioctl install --dry-run" {
    run shed-istioctl install --dry-run
    cat_expected "shed-istioctl-install-dry-run" | assert_output -
}
@test "shed istioctl install --dry-run" {
    run shed istioctl install --dry-run
    cat_expected "shed-istioctl-install-dry-run" | assert_output -
}
@test "i install --dry-run" {
    run bash -i -c 'i install --dry-run'
    cat_expected "shed-istioctl-install-dry-run" | assert_output -
}