#!/bin/bash

################################################################################
# install asvim based on official instructions
################################################################################

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
rm -rf ~/.config/nvim
git clone --depth 1 "https://github.com/AstroNvim/template" ~/.config/nvim
rm -rf ~/.config/nvim/.git
