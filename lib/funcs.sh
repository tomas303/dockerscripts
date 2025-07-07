#!/bin/bash

################################################################################
# install <extension id>
# install extension into vscode
# f.e.: install_extension "aaron-bond.better-comments"
################################################################################

function install_extension()
{
  local extname=$1
  local test=$(code --list-extensions | sed -n -e "/$extname/p")
  if [[ -z "$test" ]]; then
     code --force --verbose --install-extension="$extname"
  fi
}
