#!/bin/bash

export QT_PLUGIN_PATH=/sources/kmymoney/build/lib/lib64/plugins:$QT_PLUGIN_PATH
export XDG_CONFIG_DIRS=/sources/kmymoney/build/lib/etc/xdg:$XDG_CONFIG_DIRS
export XDG_DATA_DIRS=/sources/kmymoney/build/lib/share:$XDG_DATA_DIRS
/opt/squashfs-root/AppRun &
