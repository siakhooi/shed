#!/bin/sh
set -e

shellcheck src/bin/*

TARGET=target
SOURCE=src

mkdir "$TARGET"

# Control File
chmod +x $SOURCE/DEBIAN/postinst
cp -vr $SOURCE/DEBIAN $TARGET

# Binary Files
mkdir -p $TARGET/usr/bin
chmod +x $SOURCE/bin/*
cp -vr $SOURCE/bin $TARGET/usr

# Lib Files
mkdir -p $TARGET/usr/lib/shed
chmod +x $SOURCE/lib/*
cp -vr $SOURCE/lib/* $TARGET/usr/lib/shed

# Share file
mkdir -p $TARGET/usr/share/shed
cp -vr $SOURCE/share/* $TARGET/usr/share/shed

# Man Pages
mkdir -p $TARGET/usr/share/man/man1/
fileList=$(cd $SOURCE/md && find *.1.md | sed 's/.md//')
for file in $fileList; do
  pandoc $SOURCE/md/$file.md -s -t man | gzip -9 >$TARGET/usr/share/man/man1/$file.gz
done
mkdir -p $TARGET/usr/share/man/man5/
fileList=$(cd $SOURCE/md && find *.5.md | sed 's/.md//')
for file in $fileList; do
  pandoc $SOURCE/md/$file.md -s -t man | gzip -9 >$TARGET/usr/share/man/man5/$file.gz
done


dpkg-deb --build -Zxz $TARGET
dpkg-name ${TARGET}.deb

DEBFILE=$(ls ./*.deb)
dpkg --contents "$DEBFILE"
