#!/bin/bash

################################################################################
# setup vscode on first run                                                    #
################################################################################

if ! [[ ":$PATH:" == *":.cargo:"* ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly
  . "$HOME/.cargo/env"
  rustup override set nightly
fi
