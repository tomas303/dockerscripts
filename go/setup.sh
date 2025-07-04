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
install_extension "mike-lischke.vscode-antlr4"
install_extension "tamasfe.even-better-toml"
install_extension "GitHub.copilot"
install_extension "GitHub.copilot-chat"
install_extension "alefragnani.numbered-bookmarks"
install_extension "qwtel.sqlite-viewer"

