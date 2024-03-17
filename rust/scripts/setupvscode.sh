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

install_extension "rust-lang.rust-analyzer"
install_extension "matklad.rust-analyzer"
install_extension "vadimcn.vscode-lldb"
install_extension "serayuzgur.crates"
install_extension "swellaby.vscode-rust-test-adapter"
