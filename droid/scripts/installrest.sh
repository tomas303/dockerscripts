#!/bin/bash
set -Eeuo pipefail

################################################################################
# script for prepare droid environment(based on lineageos)                     #
################################################################################

# install repo into /usr/local/bin (already in $PATH)
repo="/usr/local/bin/repo"
if [ -f "$repo" ]; then
  rm $repo
fi
curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod a+x /usr/local/bin/repo

# install platform-tools
if [ ! -d "$EVDOCKER_SDK" ]; then
  mkdir -p "$EVDOCKER_SDK"
fi
if [ -d "$EVDOCKER_SDKPLATFORMTOOLS" ]; then
  rm -rf $EVDOCKER_SDKPLATFORMTOOLS
fi
curl https://dl.google.com/android/repository/platform-tools-latest-linux.zip --location > "$EVDOCKER_SDK/platform-tools-latest-linux.zip"
unzip "$EVDOCKER_SDK/platform-tools-latest-linux.zip" -d "$EVDOCKER_SDK"
rm "$EVDOCKER_SDK/platform-tools-latest-linux.zip"

cp $EVDOCKER_SCRIPTSDIR/droidenv.sh /etc/profile.d
