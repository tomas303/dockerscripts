#!/bin/bash

################################################################################
# download and install fpc bootstrap compiler(last official release)           #
################################################################################

# download linux compiler
FPCTAR="fpc-$FPCBootstrapVersion.x86_64-linux.tar"
wget --progress=dot:giga https://sourceforge.net/projects/freepascal/files/Linux/$FPCBootstrapVersion/$FPCTAR

# unpack only compiler
tar -x fpc-$FPCBootstrapVersion.x86_64-linux/binary.x86_64-linux.tar -f ./$FPCTAR --strip-components 1
tar -x base.x86_64-linux.tar.gz -f ./binary.x86_64-linux.tar
mkdir -p $FPCBootstrapDir
tar -x -f ./base.x86_64-linux.tar.gz -C $FPCBootstrapDir
ln -sf ../lib/fpc/$FPCBootstrapVersion/ppcx64 $FPCBootstrapDir/bin/ppcx64
# remove intermediate archives
rm base.x86_64-linux.tar.gz
rm binary.x86_64-linux.tar
rm $FPCTAR