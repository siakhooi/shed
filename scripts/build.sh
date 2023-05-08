#!/bin/sh
set -e

TARGET=target
SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET
chmod 755 $TARGET/DEBIAN/post*

# Binary Files
mkdir -p $TARGET/usr/bin
cp -vr $SOURCE/bin $TARGET/usr
chmod 755 $TARGET/usr/bin/*

# Lib Files
mkdir -p $TARGET/usr/lib/shed
find src/lib/init.d -type f -exec chmod +x -v {} \;
cp -vr $SOURCE/lib/* $TARGET/usr/lib/shed
chmod 755 $TARGET/usr/lib/shed/*

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

sha256sum "$DEBFILE" >$DEBFILE.sha256sum
sha512sum "$DEBFILE" >$DEBFILE.sha512sum

dpkg --contents "$DEBFILE"
