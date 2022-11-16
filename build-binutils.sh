#!/bin/bash
set -e

[ -d $BUILDDIR/binutils ] && rm -rf $BUILDDIR/binutils

mkdir -p $BUILDDIR/binutils
cd $BUILDDIR/binutils

export CFLAGS=${BINUTILS_CFLAGS}
export CXXFLAGS="-s"

$SRCDIR/binutils-${BINUTILSVER}/configure \
	--disable-werror --host=$HOSTMACH --build=$BUILDMACH --target=$TARGETMACH \
	--prefix=$INSTALLDIR --with-sysroot=$SYSROOTDIR \
	--program-prefix=${PROGRAM_PREFIX} --disable-multilib --disable-nls --disable-tls --enable-languages=c,lto --enable-lto --enable-gold --disable-newlib-atexit-dynamic-alloc --enable-libssp

make -j${NCPU}
make install -j${NCPU}
