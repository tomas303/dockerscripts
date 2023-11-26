#!/bin/bash

################################################################################
# launching script (prepare environment for user)                              #
################################################################################

# configure git
gitemail=$(git config --global user.email)
if [ -z "$gitemail" ]; then
  git config --global user.email "$EVDOCKER_GITEMAIL"
fi
gituser=$(git config --global user.name)
if [ -z "$gituser" ]; then
  git config --global user.name "$EVDOCKER_GITUSER"
fi

# configure lineage directory
if [ ! -d "$HOME/$EVDOCKER_LINEAGEDIR" ]; then
  mkdir -p "$HOME/$EVDOCKER_LINEAGEDIR"
fi


# add Android SDK platform tools to path
if [ -d "$EVDOCKER_SDKPLATFORMTOOLS" ] ; then
    PATH="$EVDOCKER_SDKPLATFORMTOOLS:$PATH"
fi

export USE_CCACHE=$EVDOCKER_USE_CCACHE
export CCACHE_EXEC=/usr/bin/ccache
ccache -M $EVDOCKER_CCACHE_SIZE
