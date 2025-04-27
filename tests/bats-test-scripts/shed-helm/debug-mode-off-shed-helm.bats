setup(){
    load '../common-setup'
    common_setup
}
@test "shed-helm list" {
    export SHED_BASH_DEBUG_MODE_OFF=Y
    run shed-helm list
    cat_expected "debug-mode-off-shed-helm-list" | assert_output -
}
@test "shed helm list" {
    export SHED_BASH_DEBUG_MODE_OFF=Y
    run shed helm list
    cat_expected "debug-mode-off-shed-helm-list" | assert_output -
}
@test "h list" {
    export SHED_BASH_DEBUG_MODE_OFF=Y
    run bash -i -c 'h list'
    cat_expected "debug-mode-off-shed-helm-list" | assert_output -
}