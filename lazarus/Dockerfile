# base image
# ---------------
FROM xwin

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	FPCUrl="https://gitlab.com/freepascal.org/fpc/source.git" \
	FPCSourceDir=/opt/src/fpc \
	FPCTargetLinDir=/opt/bin/fpc \
    FPCBootstrapVersion=3.2.2 \
    FPCBootstrapDir=/opt/bootstrap \
	LazarusUrl="https://gitlab.com/freepascal.org/lazarus/lazarus.git" \
	LazarusSourceDir=/opt/src/lazarus \
	LazarusTargetLinDir=/opt/bin/lazarus


# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/

# install dependecies for fpc compilation
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install mc && \ 
    apt-get -y install vim && \
	apt-get -y install wget && \
	apt-get -y install git && \ 
	apt-get -y install build-essential

# compile and install fpc
RUN $ScriptsDir/install_fpcsource.sh && \
    $ScriptsDir/install_fpcbootstrap.sh && \
    $ScriptsDir/install_fpc.sh Lin64

# install dependecies for lazarus compilation(gdb is not needed for compilation)
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install libx11-dev && \
    apt-get -y install libgtk2.0-dev && \ 
    apt-get -y install ibgdk-pixbuf2.0-dev && \
    apt-get -y install libpango1.0-dev && \
    apt-get -y install libcairo2-dev && \
    apt-get -y install libglib2.0-dev && \
    apt-get -y install gdb

# compile and install lazarus
RUN $ScriptsDir/install_lazarussource.sh && \
    $ScriptsDir/install_lazarus.sh Lin64

# Install Xwindows files
# ----------------------
# lazarus is launched via .xsessionrc(actually user is root)
# minimal configuration for jwm window manager
RUN cp $ScriptsDir/.xsessionrc /root/ && \
    cp $ScriptsDir/system.jwmrc /etc/jwm/
