#!/bin/sh
set -e

[ -d $BUILDDIR/gcc-bootstrap ] && rm -rf $BUILDDIR/gcc-bootstrap

mkdir -p $BUILDDIR/gcc-bootstrap
cd $BUILDDIR/gcc-bootstrap

export PATH=$INSTALLDIR/bin:$PATH
export CFLAGS="-s -DCOMMON_LVB_REVERSE_VIDEO=0x4000 -DCOMMON_LVB_UNDERSCORE=0x8000"
export CXXFLAGS="-s -DCOMMON_LVB_REVERSE_VIDEO=0x4000 -DCOMMON_LVB_UNDERSCORE=0x8000"
export CDIR=$PWD

#cd ${SRCDIR}/gcc-${GCCVER}
#`realpath --relative-to=./ ${SRCDIR}/gcc-${GCCVER}`/configure \
#./configure \
../../source/gcc-${GCCVER}/configure \
	--build=$BUILDMACH --host=$HOSTMACH --target=$TARGETMACH --with-cpu=m2 \
	--prefix=$INSTALLDIR --without-headers --enable-bootstrap \
	--enable-languages=c,c++,lto --disable-threads  --enable-static --disable-libmudflap \
	--with-gnu-ld --with-gnu-as --with-gcc --disable-libssp --disable-libgomp \
	--disable-nls --disable-tls --disable-shared --program-prefix=${PROGRAM_PREFIX} \
	--disable-libmpx --disable-libatomic --disable-libquadmath \
	--disable-libvtv --disable-libsanitizer --disable-coverage --disable-decimal-float \
	--with-newlib --disable-multilib --disable-libgcj \
	--disable-libstdcxx --enable-lto \
	${GCC_BOOTSTRAP_FLAGS}

#if [[ "${HOSTMACH}" != "${BUILDMACH}" ]]; then
#	# There should be a check for if gcc/auto-build.h exists
#	cp ./gcc/auto-host.h ./gcc/auto-build.h
#	mkdir gcc
#	cp $ROOTDIR/auto-host.h ./gcc/auto-build.h
#fi

make all-gcc -j${NCPU}
make install-gcc -j${NCPU}

make all-target-libgcc -j${NCPU}
make install-target-libgcc -j${NCPU}

cd ${CDIR}
