#!/bin/bash

################################################################################
# setup android studio environment on first run                                #
################################################################################

. $ScriptsDir/funcs.sh

set_git_identity

# prompt to show container id, EOF marks so called heredoc
if ! grep -q 'CONTAINER_ID' "$HOME/.bashrc"; then
echo "setting container id prompt"
cat << 'EOF' >> ~/.bashrc

# container aware prompt
PS1='\[\033[01;32m\]\u@${CONTAINER_ID:-container}\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOF
fi

# JDK = JBR bundled with Android Studio, SDK lives in home (downloaded by Studio wizard)
if ! grep -q "ANDROID_HOME" ~/.profile; then
cat << 'EOF' >> ~/.profile

# android environment
export JAVA_HOME=/opt/android-studio/jbr
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="/opt/android-studio/bin:$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
EOF
fi
