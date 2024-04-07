#!/bin/sh
set -e

. ./release.env

git commit -m "$RELEASE_TITLE"

git push
