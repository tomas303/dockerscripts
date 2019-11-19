#!/bin/bash

################################################################################
# script for installing lazarus templates
# $1 - directory, where to install(content is filled with environment varaibles)
################################################################################

source $ScriptsDir/lib.sh

TargetDir=$1

#fppkg.cfg
file=fppkg.cfg
targetfile=$TargetDir/$file
cp $ScriptsDir/$file.template $targetfile
lib_replaceInFile $targetfile "%Path%" "$FPCTargetLinDir/lib/fpc"
lib_replaceInFile $targetfile "%Prefix%" "$FPCTargetLinDir"
FppkgConfigFile=$targetfile

#environmentoptions.xml.template
file=environmentoptions.xml
targetfile=$TargetDir/$file
cp $ScriptsDir/$file.template $targetfile
lib_replaceInFile $targetfile "%LazarusDirectory%" "$LazarusTargetLinDir/share/lazarus"
lib_replaceInFile $targetfile "%CompilerFilename%" "$FPC"
lib_replaceInFile $targetfile "%FPCSourceDirectory%" "$FPCSourceDir"
lib_replaceInFile $targetfile "%DebuggerFilename%" "gdb"
lib_replaceInFile $targetfile "%FppkgConfigFile%" "$FppkgConfigFile"