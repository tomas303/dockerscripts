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

install_extension "aaron-bond.better-comments"
install_extension "CoenraadS.bracket-pair-colorizer"
install_extension "golang.go"
install_extension "gin-gonic.gin"
install_extension "mhutchie.git-graph"

