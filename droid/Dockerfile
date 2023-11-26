# base image
# ---------------
FROM debian:stable

# Maintainer
# ----------
MAINTAINER Tomáš Horák <tomashorak@post.cz>

# Environment variables
# -------------------------------------------------------------
ENV EVDOCKER_SCRIPTSDIR=/opt/scripts \
    EVDOCKER_SDK=/opt/android/sdk \
    EVDOCKER_SDKPLATFORMTOOLS=/opt/android/sdk/platform-tools \
    EVDOCKER_GITEMAIL="tomashorak@post.cz" \
    EVDOCKER_GITUSER="tomash" \
    EVDOCKER_LINEAGEDIR="$HOME/android/lineage" \
    EVDOCKER_USE_CCACHE=1 \
    EVDOCKER_CCACHE_SIZE=100G

# Install scripts
# --------------------
COPY ./scripts/*.sh $EVDOCKER_SCRIPTSDIR/

# install tools for build android
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install bc && \
    apt-get -y install bison && \
    apt-get -y install build-essential && \
    apt-get -y install ccache && \
    apt-get -y install curl && \
    apt-get -y install flex && \
    apt-get -y install g++-multilib && \
    apt-get -y install gcc-multilib && \
    apt-get -y install git && \
    apt-get -y install git-lfs && \
    apt-get -y install gnupg && \
    apt-get -y install gperf && \
    apt-get -y install imagemagick && \
    apt-get -y install lib32ncurses5-dev && \
    apt-get -y install lib32readline-dev && \
    apt-get -y install lib32z1-dev && \
    apt-get -y install libelf-dev && \
    apt-get -y install liblz4-tool && \
    apt-get -y install libsdl1.2-dev && \
    apt-get -y install libssl-dev && \
    apt-get -y install libxml2 && \
    apt-get -y install libxml2-utils && \
    apt-get -y install lzop && \
    apt-get -y install pngcrush && \
    apt-get -y install rsync && \
    apt-get -y install schedtool && \
    apt-get -y install squashfs-tools && \
    apt-get -y install xsltproc && \
    apt-get -y install zip && \
    apt-get -y install zlib1g-dev && \
    apt-get -y install libncurses5 && \
    apt-get -y install libncurses5-dev && \
    apt-get -y install python3 && \
    apt-get -y install python-is-python3 && \
    apt-get -y install mc && \
    apt-get -y install vim

# install packages for run emulator
RUN apt-get -y install libxcomposite1 && \
    apt-get -y install libxcursor1 && \
    apt-get -y install libxdamage1 && \
    apt-get -y install libxi6 && \
    apt-get -y install libxtst6


# prepare rest
RUN $EVDOCKER_SCRIPTSDIR/installrest.sh

CMD $EVDOCKER_SCRIPTSDIR/launch.sh

