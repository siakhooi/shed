#!/bin/bash
set -e
set -x

tempDir=$(mktemp -d --tmpdir "$(basename "$0")-XXXXXXXXXX")

readonly pandoc_deb_url=https://github.com/jgm/pandoc/releases/download/3.6.3/pandoc-3.6.3-1-amd64.deb
(
  cd "$tempDir"
  curl -LO "$pandoc_deb_url"
  sudo apt install -y ./pandoc-3.6.3-1-amd64.deb
)

sudo apt install -y dpkg-dev
