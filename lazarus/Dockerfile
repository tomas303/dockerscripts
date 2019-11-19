# base image
# ---------------
FROM fpc

# Maintainer
# ----------
MAINTAINER Tomáš Horák <tomashorak@post.cz>

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	LazarusUrl="https://svn.freepascal.org/svn/lazarus/trunk" \
	LazarusSourceDir=/opt/src/lazarus \
	LazarusTargetLinDir=/opt/bin/lazarus


# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/

# install dependecies for lazarus compilation(gdb is not needed for compilation)
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install libx11-dev && \
    apt-get -y install libgtk2.0-dev && \ 
    apt-get -y install ibgdk-pixbuf2.0-dev && \
    apt-get -y install libpango1.0-dev && \
    apt-get -y install libcairo2-dev && \
    apt-get -y install libglib2.0-dev && \
    apt-get -y install gdb

# compile and install fpc
RUN $ScriptsDir/install_lazarussource.sh && \
    $ScriptsDir/install_lazarus.sh Lin64

# install Xwindows
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-core && \ 
    DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-input-all && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xserver-xorg-video-fbdev && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dbus && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install fonts-dejavu-core  && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install xinit && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install x11-xserver-utils && \
	apt-get -y install jwm

# Install Xwindows files
# ----------------------
# lazarus is launched via .xsessionrc(actually user is root)
# minimal configuration for jwm window manager
RUN cp $ScriptsDir/.xsessionrc /root/ && \
    cp $ScriptsDir/system.jwmrc /etc/jwm/system.jwmrc

ENTRYPOINT $ScriptsDir/launch_X.sh
