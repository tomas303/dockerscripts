#!/bin/bash

################################################################################
# script for compile and install fpc compiler                                  #
################################################################################

source $ScriptsDir/lib.sh

function fpcLin64Links
(
  echo $FUNCNAME
  pushd $FPCTargetLinDir/bin
  ln -sf ../lib/fpc/$FPCCompilerVersion/ppcx64 ppcx64
  popd
  pushd $FPCTargetLinDir/lib/fpc/$FPCCompilerVersion
  ln -sf ../../../bin/fpcres ./fpcres
  popd
)

function fpcLin64cfg
(
  echo $FUNCNAME
  mdir=$FPCTargetLinDir/lib/fpc/etc
  mkdir -p $mdir
  pushd $mdir
  rm -rf fpc.cfg
  echo "# c - C style operators, a - include assertion code, h - huge(ansi) strings" > fpc.cfg
  echo "-Scah" >> fpc.cfg
  echo "# print free pascal logo and version" >> fpc.cfg
  echo "-l" >> fpc.cfg
  echo "# unit search paths (enclose between $ and $ expand to environment variable)" >> fpc.cfg
  echo "-Fu$FPCTargetLinDir/lib/fpc/$FPCCompilerVersion/units/\$FPCTARGET/*" >> fpc.cfg
  echo "-Fu$FPCTargetLinDir/lib/fpc/$FPCCompilerVersion/units/\$FPCTARGET/rtl/*" >> fpc.cfg
  popd
)

function fpcLin64
(
  export OS_TARGET=linux
  export CPU_TARGET=x86_64
  export INSTALL_PREFIX=$FPCTargetLinDir
  export PP=$FPCBootstrapDir/bin/fpc
  lib_make $FPCSourceDir clean
  lib_make $FPCSourceDir all
  lib_make $FPCSourceDir install
  lib_make $FPCSourceDir clean
)

cmd=$1

if [ "$cmd" = "Lin64" ]; then
	lib_run fpcLin64
	FPCCompilerVersion=3.3.1
	lib_run fpcLin64cfg
	lib_run fpcLin64Links
fi

