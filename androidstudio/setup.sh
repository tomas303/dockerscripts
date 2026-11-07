#!/bin/bash

################################################################################
# setup android studio environment on first run                                #
################################################################################

. $ScriptsDir/funcs.sh
. $ScriptsDir/setup_default.sh

# JDK = JBR bundled with Android Studio, SDK lives in home (downloaded by Studio wizard)
if ! grep -q "ANDROID_HOME" ~/.profile; then
cat << 'EOF' >> ~/.profile

# android environment
export JAVA_HOME=/opt/android-studio/jbr
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="/opt/android-studio/bin:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
EOF
fi
