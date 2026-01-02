#!/bin/bash

# either config dir is set from outside or we use config generated during compilation

source $ScriptsDir/lib.sh

# $LazarusConfigDir is yet to be tested location for config files. One would want
# to supply it from outside to outlive docker container.
if [ -z "$LazarusConfigDir" ]
then
  LazarusConfigDir=$LazarusTargetLinDir/runlazarus/linux
  if [ ! -d "$LazarusConfigDir" ]
  then
  	mkdir -p $LazarusConfigDir
  fi
fi
echo $LazarusConfigDir
if [ -d "$LazarusConfigDir" ]
then
  # here copy config files in case they not exists
  if [ ! -f "$LazarusConfigDir/environmentoptions.xml" ]; then
      $ScriptsDir/install_templates.sh $LazarusConfigDir
  fi
  $LazarusTargetLinDir/bin/startlazarus --primary-config-path=$LazarusConfigDir &
else
  echo lazarus config directory `lib_printvar LazarusConfigDir` doesn''t exists
  exit 1
fi
