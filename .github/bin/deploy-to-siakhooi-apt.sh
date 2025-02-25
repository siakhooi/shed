#!/bin/bash
set -e

PATH_TO_FILE=$(ls ./*.deb)
DEBIAN_PACKAGE_SOURCE_PATH=$(realpath "$PATH_TO_FILE")
DEBIAN_PACKAGE_FILE=$(basename "$PATH_TO_FILE")

TMPDIR=$(mktemp -d)

readonly TARGETPATH=docs/pool/main/binary-amd64
readonly TARGETURL=https://${PUBLISH_TO_GITHUB_REPO_TOKEN}@github.com/siakhooi/apt.git
readonly TARGETBRANCH=main
readonly TARGETDIR=apt
readonly TARGET_GIT_EMAIL=shed@siakhooi.github.io
readonly TARGET_GIT_USERNAME=shed
TARGET_COMMIT_MESSAGE="shed: Auto deploy [$(date)]"

(
  cd "$TMPDIR"
  git config --global user.email "$TARGET_GIT_EMAIL"
  git config --global user.name "$TARGET_GIT_USERNAME"

  git clone -n --depth=1 -b "$TARGETBRANCH" "$TARGETURL" "$TARGETDIR"
  cd "$TARGETDIR"
  git remote set-url origin "$TARGETURL"
  git restore --staged .
  mkdir -p $TARGETPATH
  cp -v "$DEBIAN_PACKAGE_SOURCE_PATH" "$TARGETPATH/$DEBIAN_PACKAGE_FILE"
  git add "$TARGETPATH/$DEBIAN_PACKAGE_FILE"
  git status
  git commit -m "$TARGET_COMMIT_MESSAGE"
  git push
)
find .
