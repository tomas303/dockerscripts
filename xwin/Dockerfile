# base image
# ---------------
FROM debian:testing

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	DockerXDisplay=1 \
	DockerXTerminal=vt8


# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/

# install dependecies
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install mc && \ 
    apt-get -y install vim && \
	apt-get -y install wget

# install Xwindows
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-core && \ 
    DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-input-all && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-video-fbdev && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dbus && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install fonts-dejavu-core  && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xinit && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install x11-xserver-utils && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xorgxrdp && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dbus && \
	apt-get -y install jwm


# Install Xwindows files
# ----------------------
# minimal configuration for jwm window manager
RUN cp $ScriptsDir/.xsessionrc /root/ && \
    cp $ScriptsDir/system.jwmrc /etc/jwm/ && \
    cp $ScriptsDir/x50-docker /etc/X11/Xresources/

CMD $ScriptsDir/launch_X.sh
