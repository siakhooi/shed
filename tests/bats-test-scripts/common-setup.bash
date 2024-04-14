common_setup(){
    load "$BATS_HELPER/bats-support/load"
    load "$BATS_HELPER/bats-assert/load"

    PATH="$SOURCE_BIN:$PATH"

    source /usr/lib/shed/shed-init
}