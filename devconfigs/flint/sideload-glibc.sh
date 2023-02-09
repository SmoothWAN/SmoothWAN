mkdir sideload-glibc
cd sideload-glibc || exit 1
wget https://deb.debian.org/debian/pool/main/g/gcc-8/libgcc1_8.3.0-6_armhf.deb
ar x *.deb
tar -xvf data.tar.xz
cp lib usr ../files/ -rP
cd ..