#!/bin/bash

################################################################################
# install minimal xwindows and jwm manager                                     #
################################################################################

DEBIAN_FRONTEND=noninteractive
apt-get -y install xserver-xorg-core
apt-get -y install xserver-xorg-input-all
apt-get -y install xserver-xorg-video-fbdev
apt-get -y install dbus
apt-get -y install fonts-dejavu-core
apt-get -y install xinit
apt-get -y install x11-xserver-utils
apt-get -y install jwm
