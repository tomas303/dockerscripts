#!/bin/bash

################################################################################
# setup vscode on first run                                                    #
################################################################################

function install_extension()
{
  local extname=$1
  local test=$(code --list-extensions | sed -n -e "/$extname/p")
  if [[ -z "$test" ]]; then
     code --verbose --install-extension="$extname"
  fi
}

install_extension "Ionide.Ionide-fsharp"
install_extension "ms-vscode.powershell"
install_extension "alefragnani.numbered-bookmarks"