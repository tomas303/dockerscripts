#!/bin/bash

################################################################################
# setup vscode on first run                                                    #
################################################################################

. $ScriptsDir/funcs.sh
. $ScriptsDir/setup_default.sh

install_extension "Ionide.Ionide-fsharp"
install_extension "ms-vscode.powershell"
