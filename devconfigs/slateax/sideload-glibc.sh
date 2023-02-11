#!/bin/sh
mkdir sideload-glibc
cd sideload-glibc || exit 1
wget http://ftp.de.debian.org/debian/pool/main/g/glibc/libc6_2.31-13+deb11u5_armhf.deb
ar x *.deb
tar -xvf data.tar.xz
cp lib usr ../files/ -rP
cd ..