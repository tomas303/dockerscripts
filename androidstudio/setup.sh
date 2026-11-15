#!/bin/bash

################################################################################
# setup android studio environment on first run                                #
################################################################################

. $ScriptsDir/funcs.sh
. $ScriptsDir/setup_default.sh

# JDK for sdkmanager = JBR bundled with Android Studio, unless JAVA_HOME is already set
export JAVA_HOME="${JAVA_HOME:-/opt/android-studio/jbr}"
# default location Studio looks at, so its Setup Wizard is not needed
export ANDROID_HOME="$HOME/Android/Sdk"
SDKMANAGER="$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager"

################################################################################
# install_cmdline_tools
# download android command line tools (sdkmanager) into ANDROID_HOME (once)
# url comes from ANDROID_CMDLINE_TOOLS_URL set in Dockerfile
################################################################################

function install_cmdline_tools()
{
  if [ -x "$SDKMANAGER" ]; then
    return 0
  fi
  local zip tmp rc
  zip=$(mktemp --suffix=.zip) || return 1
  tmp=$(mktemp -d) || return 1
  wget "$ANDROID_CMDLINE_TOOLS_URL" -O "$zip" \
    && unzip -q "$zip" -d "$tmp" \
    && mkdir -p "$ANDROID_HOME/cmdline-tools" \
    && rm -rf "$ANDROID_HOME/cmdline-tools/latest" \
    && mv "$tmp/cmdline-tools" "$ANDROID_HOME/cmdline-tools/latest"
  rc=$?
  rm -rf "$zip" "$tmp"
  if [ $rc -ne 0 ]; then
    echo "installing android command line tools failed" >&2
  fi
  return $rc
}

################################################################################
# install_sdk_package <package>
# install package via sdkmanager, skipped when already installed
# f.e.: install_sdk_package "platforms;android-36"
################################################################################

function install_sdk_package()
{
  local package=$1
  if [ ! -d "$ANDROID_HOME/${package//;//}" ]; then
    "$SDKMANAGER" "$package"
  fi
}

################################################################################
# install_default_sdk_packages
# install packages listed in ANDROID_SDK_PACKAGES set in Dockerfile
# licenses are accepted only once (until ANDROID_HOME/licenses exists)
################################################################################

function install_default_sdk_packages()
{
  if [ ! -x "$SDKMANAGER" ]; then
    echo "sdkmanager not found, skipping sdk packages" >&2
    return 1
  fi
  if [ ! -d "$ANDROID_HOME/licenses" ]; then
    yes | "$SDKMANAGER" --licenses > /dev/null
  fi
  local package
  for package in $ANDROID_SDK_PACKAGES; do
    install_sdk_package "$package"
  done
}

################################################################################
# set_android_profile
# add android environment into ~/.profile (once)
################################################################################

function set_android_profile()
{
  touch ~/.profile
  if grep -q "ANDROID_HOME" ~/.profile; then
    return 0
  fi
  cat << 'EOF' >> ~/.profile

# android environment
# JAVA_HOME (needed by sdkmanager) defaults to bundled JBR, own JDK can be set before this line
export JAVA_HOME="${JAVA_HOME:-/opt/android-studio/jbr}"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="/opt/android-studio/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
EOF
}

install_cmdline_tools
install_default_sdk_packages
set_android_profile
