#!/bin/bash

################################################################################
# download and install fpc bootstrap compiler(last official release)           #
################################################################################

#FPCBootstrapVersion=3.0.4

# wget ftp://ftp.freepascal.org/fpc/dist/3.0.4/x86_64-linux/fpc-3.0.4.x86_64-linux.tar
# tar -x fpc-3.0.4.x86_64-linux/binary.x86_64-linux.tar -f ./fpc-3.0.4.x86_64-linux.tar --strip-components 1
# tar -x base.x86_64-linux.tar.gz -f ./binary.x86_64-linux.tar
# mkdir -p /tmp/bootstrap
# tar -x -f ./base.x86_64-linux.tar.gz -C /tmp/bootstrap
#
# export PATH=$PATH:/tmp/bootstrap/lib/fpc/3.0.4 ... or fpc wont finc ppx64 ... or I will create synlink

# download linux compiler
wget --progress=dot:1G ftp://ftp.freepascal.org/fpc/dist/$FPCBootstrapVersion/x86_64-linux/fpc-$FPCBootstrapVersion.x86_64-linux.tar
# unpack only compiler
tar -x fpc-$FPCBootstrapVersion.x86_64-linux/binary.x86_64-linux.tar -f ./fpc-$FPCBootstrapVersion.x86_64-linux.tar --strip-components 1
tar -x base.x86_64-linux.tar.gz -f ./binary.x86_64-linux.tar
mkdir -p $FPCBootstrapDir
tar -x -f ./base.x86_64-linux.tar.gz -C $FPCBootstrapDir
ln -sf ../lib/fpc/$FPCBootstrapVersion/ppcx64 $FPCBootstrapDir/bin/ppcx64
# remove intermediate archives
rm base.x86_64-linux.tar.gz
rm binary.x86_64-linux.tar
rm fpc-$FPCBootstrapVersion.x86_64-linux.tar