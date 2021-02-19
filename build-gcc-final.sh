#!/bin/bash
set -e

[ -d $BUILDDIR/gcc-final ] && rm -rf $BUILDDIR/gcc-final

mkdir $BUILDDIR/gcc-final
cd $BUILDDIR/gcc-final

#echo "libc_cv_forced_unwind=yes" > config.cache
#echo "libc_ctors_header=yes" >> config.cache
#echo "libc_cv_c_cleanup=yes" >> config.cache

export PATH=$INSTALLDIR/bin:$PATH
export CFLAGS="-s -DCOMMON_LVB_REVERSE_VIDEO=0x4000 -DCOMMON_LVB_UNDERSCORE=0x8000  -DHAVE_FPUTS_UNLOCKED=1"
export CXXFLAGS="-s -DCOMMON_LVB_REVERSE_VIDEO=0x4000 -DCOMMON_LVB_UNDERSCORE=0x8000 -DHAVE_FPUTS_UNLOCKED=1"
export CDIR=$PWD

#cd ${SRCDIR}/gcc-${GCCVER}
#`realpath --relative-to=./ ${SRCDIR}/gcc-${GCCVER}`/configure \
#./configure \
../../source/gcc-${GCCVER}/configure \
	--build=$BUILDMACH --target=$TARGETMACH --host=$HOSTMACH --with-cpu=m2 \
	--prefix=$INSTALLDIR --enable-languages=c,c++,lto  --disable-bootstrap \
	--with-gnu-as --with-gnu-ld --disable-shared --disable-threads \
	--disable-multilib --disable-libmudflap --disable-libgcj --enable-libssp --enable-lto \
	--disable-libmpx --disable-libgomp --disable-libatomic --disable-libquadmath \
	--disable-libvtv --disable-libsanitizer --disable-libgomp --disable-install-libiberty \
	--disable-coverage --disable-nls --disable-tls --with-newlib --with-glibc --disable-decimal-float \
	--enable-offload-target=$TARGETMACH \
	--program-prefix=${PROGRAM_PREFIX} ${GCC_FINAL_FLAGS}

make -j${NCPU}
make install -j${NCPU}

cd ${CDIR}
