common_setup(){
    load "$BATS_HELPER/bats-support/load"
    load "$BATS_HELPER/bats-assert/load"

    PATH="$SOURCE_BIN:$PATH"

    source /usr/lib/shed/shed-init
}
cat_expected(){
    local description
    description=$1

    if [[ -z $description ]]; then
      short_name=$BATS_TEST_FILENAME.expected
      long_name=$(dirname $BATS_TEST_FILENAME)/$BATS_TEST_DESCRIPTION.expected
      if [[ -f $long_name ]]; then
        cat $long_name
      elif [[ -f $short_name ]]; then
        cat $short_name
      else
        echo "Unable to find expected file ($short_name, $long_name) !" >&2
        exit 1
      fi
    else
      custom_name1=$(dirname $BATS_TEST_FILENAME)/$description
      custom_name2=$(dirname $BATS_TEST_FILENAME)/$description.expected
      if [[ -f $custom_name1 ]]; then
        cat $custom_name1
      elif [[ -f $custom_name2 ]]; then
        cat $custom_name2
      else
        echo "Unable to find expected file ($custom_name1, $custom_name2) !" >&2
        exit 1
      fi
    fi
}