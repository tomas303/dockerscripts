#!/usr/bin/env bash
set -euo pipefail

NVIM_CONFIG="$HOME/.config/nvim"
APPS_DIR="$HOME/.local/share/applications"

echo ""
echo ""
echo "Bootstrapping Neovim configuration..."
echo ""
echo ""


# app desktop file(for export command)
mkdir -p "$APPS_DIR"
cp -f "/opt/nvim.desktop" "$APPS_DIR"

# remove old home config
rm -rf "$HOME/.local/share/nvim"
rm -rf "$HOME/.local/state/nvim"
rm -rf "$HOME/.cache/nvim"
rm -rf "$HOME/.config/nvim"

# Install kickstart.nvim
git clone https://github.com/tomas303/kickstart.nvim.git "$NVIM_CONFIG"

# Install extensions
nvim --headless +'MasonInstall marksman dockerfile-language-server yaml-language-server' +qall

echo ""
echo ""
echo "Neovim bootstrap complete."
echo ""
echo ""
