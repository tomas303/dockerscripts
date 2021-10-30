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

function fpcLinfppkgcfg
(
  echo $FUNCNAME
  mkdir -p "/etc/fppkg"
  pushd "/etc/fppkg"
  echo "[Defaults]" > default
  echo "ConfigVersion=5" >> default
  echo "Compiler=$FPCTargetLinDir/bin/fpc" >> default
  echo "OS=Linux" >> default
  echo "CPU=x86_64" >> default
  popd

  pushd "/etc"
  echo "[Defaults]" > fppkg.cfg
  echo "ConfigVersion=5" >> fppkg.cfg
  echo "LocalRepository={UserDir}.fppkg/" >> fppkg.cfg
  echo "BuildDir={LocalRepository}build/" >> fppkg.cfg
  echo "ArchivesDir={LocalRepository}archives/" >> fppkg.cfg
  echo "CompilerConfigDir=/etc/fppkg/" >> fppkg.cfg
  echo "RemoteMirrors=https://www.freepascal.org/repository/mirrors.xml" >> fppkg.cfg
  echo "RemoteRepository=auto" >> fppkg.cfg
  echo "CompilerConfig=default" >> fppkg.cfg
  echo "FPMakeCompilerConfig=default" >> fppkg.cfg
  echo "Downloader=FPC" >> fppkg.cfg
  echo "InstallRepository=user" >> fppkg.cfg
  echo "" >> fppkg.cfg
  echo "[Repository]" >> fppkg.cfg
  echo "Name=fpc" >> fppkg.cfg
  echo "Description=Packages which are installed along with the Free Pascal Compiler" >> fppkg.cfg
  echo "Path=$FPCTargetLinDir/lib/fpc/{CompilerVersion}/" >> fppkg.cfg
  echo "Prefix=$FPCTargetLinDir" >> fppkg.cfg
  echo "" >> fppkg.cfg
  echo "[IncludeFiles]" >> fppkg.cfg
  echo "FileMask=/etc/fppkg/conf.d/*.conf" >> fppkg.cfg
  echo "" >> fppkg.cfg
  echo "[Repository]" >> fppkg.cfg
  echo "Name=user" >> fppkg.cfg
  echo "Description=User-installed packages" >> fppkg.cfg
  echo "Path={LocalRepository}lib/fpc/{CompilerVersion}" >> fppkg.cfg
  echo "Prefix={LocalRepository}" >> fppkg.cfg  popd
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
    FPCCompilerVersion=$(sed -n -r -e '/version=(.*)/,1 s/[^=]*=(.*)/\1/p' $FPCSourceDir/Makefile.fpc)
	lib_run fpcLin64cfg
	lib_run fpcLinfppkgcfg
	lib_run fpcLin64Links
fi

