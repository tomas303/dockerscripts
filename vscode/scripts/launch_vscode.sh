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
code --no-sandbox --user-data-dir="$VSCodeUserDataDir" --extensions-dir="$VSCodeExtensionsDir" &
