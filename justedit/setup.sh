#!/bin/bash

################################################################################
# setup vscode on first run                                                    #
################################################################################

. $ScriptsDir/funcs.sh
. $ScriptsDir/setup_default.sh

install_extension "tamasfe.even-better-toml"
install_extension "redhat.vscode-yaml"
