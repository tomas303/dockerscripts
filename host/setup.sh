#!/bin/bash

################################################################################
# setup host system (openSUSE MicroOS / Tumbleweed / Leap)                     #
# installs programs that make sense to run directly on host, rest lives in     #
# containers. Run as normal user, sudo is used where needed.                   #
# On MicroOS (transactional) packages are available after reboot.              #
################################################################################

set -e

# edit this list
PACKAGES=(
  sway
  swaybg
  swayidle
  swaylock
  waybar
  foot
  wofi
  grim
  slurp
  wl-clipboard
  distrobox
  podman
  go-task
  git
  neovim
)

if command -v transactional-update > /dev/null; then
  # filter out already installed packages, so nothing is rebuilt needlessly
  missing=()
  for p in "${PACKAGES[@]}"; do
    rpm -q "$p" > /dev/null 2>&1 || missing+=("$p")
  done
  if [[ ${#missing[@]} -eq 0 ]]; then
    echo "all host packages already installed"
  else
    sudo transactional-update -n pkg install "${missing[@]}"
    echo "packages installed into new snapshot, reboot to activate"
  fi
else
  sudo zypper --non-interactive install --no-recommends "${PACKAGES[@]}"
fi
