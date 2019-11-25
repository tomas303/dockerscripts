#!/bin/bash

################################################################################
# script for compile and install fpc compiler                                  #
################################################################################

source $ScriptsDir/lib.sh

function Lin64RunConfiguration
(
  mRunDir=$LazarusTargetLinDir/runlazarus
  mRunConfigDir=$mRunDir/linux
  mkdir -p $mRunConfigDir

  # basic configuration(just for env. dialog be skipped)
  pushd $mRunConfigDir
  mEnvOpt=environmentoptions.xml
  rm -rf $mEnvOpt
  echo '<?xml version="1.0" encoding="UTF-8"?>' > $mEnvOpt
  echo '<CONFIG>' >> $mEnvOpt
  echo '  <EnvironmentOptions>' >> $mEnvOpt
  echo '    <Version Value="110" Lazarus="2.1.0"/>' >> $mEnvOpt
  echo '    <LazarusDirectory Value="'$LazarusTargetLinDir'/share/lazarus">' >> $mEnvOpt
  echo '    </LazarusDirectory>' >> $mEnvOpt
  echo '    <CompilerFilename Value="'$FPC'">' >> $mEnvOpt
  echo '    </CompilerFilename>' >> $mEnvOpt
  echo '    <FPCSourceDirectory Value="'$FPCSourceDir'"/>' >> $mEnvOpt
  echo '    <DebuggerFilename Value="gdb"/>' >> $mEnvOpt
  echo '    <Recent AlreadyPopulated="True"/>' >> $mEnvOpt
  echo '  </EnvironmentOptions>' >> $mEnvOpt
  echo '</CONFIG>' >> $mEnvOpt
  popd
)

function Lin64Rebuild
(
  $LazarusTargetLinDir/bin/lazbuild --primary-config-path=$LazarusTargetLinDir/runlazarus/linux --build-ide= --add-package AnchorDocking AnchorDockingDsgn Cody
)

function Lin64
(
  export OS_TARGET=linux
  export CPU_TARGET=x86_64
  export INSTALL_PREFIX=$LazarusTargetLinDir
  lib_make $LazarusSourceDir distclean
  lib_make $LazarusSourceDir bigide
  lib_make $LazarusSourceDir install
)

cmd=$1

if [ "$cmd" = "Lin64" ]; then
	export FPC=$FPCTargetLinDir/bin/fpc
	lib_run Lin64
	lib_run Lin64RunConfiguration
	lib_run Lin64Rebuild
fi
