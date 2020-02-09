# base image
# ---------------
FROM debian:testing

# Maintainer
# ----------
MAINTAINER Tomáš Horák <tomashorak@post.cz>

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	KDevelopUrl="https://download.kde.org/stable/kdevelop/5.5.0/bin/linux/KDevelop-5.5.0-x86_64.AppImage"

# Install scripts
# --------------------
COPY ./scripts/ $ScriptsDir/

# basic
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install mc && \ 
    apt-get -y install vim && \
	apt-get -y install wget && \
	apt-get -y install build-essential && \
	apt-get -y install cmake && \
	apt-get -y install extra-cmake-modules && \
	apt-get -y install qtbase5-dev && \
	apt-get -y install kdevelop-dev

# kdevelop
RUN wget --progress=dot:giga -O /opt/KDevelop.AppImage $KDevelopUrl && \
	chmod a+x /opt/KDevelop.AppImage && \
	cd /opt/ && \
	./KDevelop.AppImage --appimage-extract

# Xwindows
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-core && \ 
    DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-input-all && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-video-fbdev && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dbus && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install fonts-dejavu-core  && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xinit && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install x11-xserver-utils && \
	apt-get -y install jwm

# for kmymoney build
RUN apt-get -y install libgpgmepp-dev && \
    apt-get -y install libqt5svg5-dev && \
    apt-get -y install gettext && \
    apt-get -y install libkf5wallet-dev && \
    apt-get -y install libkf5doctools-dev && \
    apt-get -y install libkf5holidays-dev && \
    apt-get -y install libkf5contacts-dev && \
    apt-get -y install libkf5akonadi-dev && \
    apt-get -y install libkf5identitymanagement-dev && \
    apt-get -y install libkf5activities-dev && \
    apt-get -y install libalkimia5-dev && \
    apt-get -y install libkf5webkit-dev && \
    apt-get -y install libgpg-error-dev && \
    apt-get -y install libgpgme-dev



RUN cp $ScriptsDir/.xsessionrc /root/ && \
    cp $ScriptsDir/system.jwmrc /etc/jwm/ && \
    cp $ScriptsDir/x50-docker /etc/X11/Xresources/


CMD $ScriptsDir/common/launch_X.sh