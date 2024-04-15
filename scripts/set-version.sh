#!/bin/sh
set -e

. ./release.env

sed -i 'src/DEBIAN/control'  -e 's@Version: .*@Version: '$RELEASE_VERSION'@g'
sed -i 'src/lib/shed-init'  -e 's@export SHED_VERSION=.*@export SHED_VERSION='$RELEASE_VERSION'@g'
sed -i 'test/expected/shed-env/shed_env.out'  -e 's@SHED_VERSION=.*@SHED_VERSION='$RELEASE_VERSION'@g'
sed -i 'test/expected/shed-env/shed-env.out'  -e 's@SHED_VERSION=.*@SHED_VERSION='$RELEASE_VERSION'@g'
