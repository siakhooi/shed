#!/bin/sh
set -e

. ./release.env

sed -i 'src/DEBIAN/control'  -e 's@Version: .*@Version: '$RELEASE_VERSION'@g'
