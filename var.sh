#!/bin/bash
export RELSRCDIR=./toolchain/source
export SRCDIR=$PWD/toolchain/source
export BUILDDIR=$PWD/toolchain/build
export TARGETMACH=sh-elf
export BUILDMACH=x86_64-pc-msys
#i686-pc-msys
export HOSTMACH=x86_64-pc-msys
#i686-pc-msys
export INSTALLDIR=$PWD/toolchain/toolchain
export SYSROOTDIR=$INSTALLDIR/sysroot
export ROOTDIR=$PWD/toolchain
export DOWNLOADDIR=$PWD/toolchain/download
export PROGRAM_PREFIX=sh-elf-

export BINUTILSVER=2.36.1
export BINUTILSREV=
export GCCVER=10.2.0
export GCCREV=
export NEWLIBVER=4.1.0
export NEWLIBREV=
export MPCVER=1.2.1
export MPCREV=
export MPFRVER=4.1.0
export MPFRREV=
export GMPVER=6.2.1
export GMPREV=
export GLIBCVER=2.33
export GLIBCREV=

export OBJFORMAT=ELF

#export TARGETMACH=sh-elf

export BINUTILS_CFLAGS="-s"
export GCC_BOOTSTRAP_FLAGS="--with-cpu=m2"
export GCC_FINAL_FLAGS="--with-cpu=m2 --with-sysroot=$SYSROOTDIR"
export NCPU=8
export QTIFWDIR=./installer