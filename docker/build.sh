#!/bin/bash

VERSION=$1
wget --progress=dot:mega https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/snapshot/util-linux-${VERSION}.tar.gz

tar -xf util-linux-${VERSION}.tar.gz

cd /build/util-linux-${VERSION}

./autogen.sh && ./configure --disable-all-programs --enable-blkid --enable-libblkid --enable-static-programs=blkid

make

mkdir -p /shared
cp blkid.static /shared
