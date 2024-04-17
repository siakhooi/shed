setup(){
    load '../common-setup'
    common_setup
}
@test "shed kubectl-logs-follow" {
    run shed kubectl-logs-follow
    assert_success
    cat_expected "shed-kubectl-logs-follow-usage" | assert_output -
}
@test "shed kubectl-logs-follow xxx yyy zzz" {
    run shed kubectl-logs-follow xxx yyy zzz
    assert_success
    cat_expected "shed-kubectl-logs-follow-usage" | assert_output -
}
@test "shed kubectl-logs-follow xxx" {
    run shed kubectl-logs-follow xxx
    assert_failure 1
    cat_expected "shed-kubectl-logs-follow-xxx" | assert_output -
}
@test "shed-kubectl-apply hello-world; shed kubectl-logs-follow hello-world" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |shed kubectl-logs-follow say-hello "
    assert_success
    cat_expected "shed-kubectl-logs-follow" | assert_output -
    shed-kubectl-delete hello-world
}
@test "shed-kubectl-apply hello-world; shed kubectl-logs-follow hello-world busybox-1" {
    skip 'Unable to use a TTY - input is not a terminal or the right kind of file'
    shed-kubectl-apply hello-world
    run bash -ic "echo 'exit' |shed kubectl-logs-follow say-hello busybox-1"
    assert_success
    cat_expected "shed-kubectl-logs-follow-container" | assert_output -
    shed-kubectl-delete hello-world
}
