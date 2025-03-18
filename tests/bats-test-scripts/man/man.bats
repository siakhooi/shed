setup(){
    load '../common-setup'
    common_setup
}
save-man(){
    section=$1
    page_name=$2
    expected_output="man-${section}-${page_name}"
    run bash -c "MANWIDTH=120 man -s $section --pager=cat $page_name> $BATS_TEST_DIRNAME/${expected_output}.expected.new"
}
run-man-test(){
    section=$1
    page_name=$2
    expected_output="man-${section}-${page_name}"
    run bash -c "MANWIDTH=120 man -s $section --pager=cat $page_name"
    cat_expected "$expected_output" | assert_output -
}
@test "man shed-config.yaml" {
    run-man-test 5 shed-config.yaml
}
@test "man shed-aliases" {
    run-man-test 1 shed-aliases
}
@test "man shed-contexts" {
    run-man-test 1 shed-contexts
}
@test "man shed-config-edit" {
    run-man-test 1 shed-config-edit
}
@test "man shed-config-get" {
    run-man-test 1 shed-config-get
}
@test "man shed-config" {
    run-man-test 1 shed-config
}
@test "man shed-env" {
    run-man-test 1 shed-env
}
@test "man shed-helm" {
    run-man-test 1 shed-helm
}
@test "man shed-kubeconfig-use" {
    run-man-test 1 shed-kubeconfig-use
}
@test "man shed-kubectl-exec-bash" {
    run-man-test 1 shed-kubectl-exec-bash
}
@test "man shed-kubectl-exec-sh" {
    run-man-test 1 shed-kubectl-exec-sh
}
@test "man shed-kubectl-logs-follow" {
    run-man-test 1 shed-kubectl-logs-follow
}
@test "man shed-kubectl-logs-previous" {
    run-man-test 1 shed-kubectl-logs-previous
}
@test "man shed-kubectl-secret-decode" {
    run-man-test 1 shed-kubectl-secret-decode
}
@test "man shed-kubectl-scale" {
    run-man-test 1 shed-kubectl-scale
}
@test "man shed-kubectl-apply" {
    run-man-test 1 shed-kubectl-apply
}
@test "man shed-kubectl-delete" {
    run-man-test 1 shed-kubectl-delete
}
@test "man shed-kubectl" {
    run-man-test 1 shed-kubectl
}
@test "man shed-list-code" {
    run-man-test 1 shed-list-code
}
@test "man shed-list" {
    run-man-test 1 shed-list
}
@test "man shed-use" {
    run-man-test 1 shed-use
}
@test "man shed-value-key-list" {
    run-man-test 1 shed-value-key-list
}
@test "man shed-value" {
    run-man-test 1 shed-value
}
@test "man shed-values" {
    run-man-test 1 shed-values
}
@test "man shed-version" {
    run-man-test 1 shed-version
}
@test "man shed-kubectl-resources" {
    run-man-test 1 shed-kubectl-resources
}
@test "man shed" {
    run-man-test 1 shed
}
@test "shed" {
    run bash -c "MANWIDTH=120 PAGER=cat shed"
    cat_expected "man-1-shed" | assert_output -
}
@test "shed help" {
    run bash -c "MANWIDTH=120 PAGER=cat shed help"
    cat_expected "man-1-shed" | assert_output -
}
