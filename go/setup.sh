#!/bin/bash

################################################################################
# setup vscode on first run                                                    #
################################################################################

. $ScriptsDir/funcs.sh

install_extension "aaron-bond.better-comments"
install_extension "CoenraadS.bracket-pair-colorizer"
install_extension "golang.go"
install_extension "mike-lischke.vscode-antlr4"
install_extension "tamasfe.even-better-toml"
install_extension "GitHub.copilot"
install_extension "GitHub.copilot-chat"
install_extension "alefragnani.numbered-bookmarks"
install_extension "qwtel.sqlite-viewer"

/usr/local/go/bin/go install -v github.com/go-delve/delve/cmd/dlv@latest

if ! grep "/usr/local/go/bin:" ~/.profile; then
  echo >> ~/.profile 
  echo "# add go path" >> ~/.profile
  echo 'PATH="/usr/local/go/bin:$PATH"' >> ~/.profile
fi
