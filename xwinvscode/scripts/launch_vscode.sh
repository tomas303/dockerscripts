#!/bin/bash

if [ -z "$VSCodeUserDataDir" ]
then
  VSCodeUserDataDir="~/userdatadir"
  if [ ! -d "$VSCodeUserDataDir" ]
  then
  	mkdir -p $VSCodeUserDataDir
  fi
fi
echo "vscode userdatadir = $VSCodeUserDataDir"

if [ -z "$VSCodeExtensionsDir" ]
then
  VSCodeExtensionsDir="~/extensionsdir"
  if [ ! -d "$VSCodeExtensionsDir" ]
  then
  	mkdir -p $VSCodeExtensionsDir
  fi
fi
echo "vscode extensionsdir = $VSCodeExtensionsDir"

# in case of problems use --verbose param
# --disable-gpu probably prevent random freeze with text failed to connect to the bus
code --disable-gpu --no-sandbox --user-data-dir="$VSCodeUserDataDir" --extensions-dir="$VSCodeExtensionsDir"
