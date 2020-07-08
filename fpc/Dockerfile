# base image
# ---------------
FROM debian:testing

# Maintainer
# ----------
MAINTAINER Tomáš Horák <tomashorak@post.cz>

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	FPCUrl="http://svn.freepascal.org/svn/fpc/trunk/" \
	FPCSourceDir=/opt/src/fpc \
	FPCTargetLinDir=/opt/bin/fpc \
    FPCBootstrapVersion=3.2.0 \
    FPCBootstrapDir=/opt/bootstrap

# Install scripts
# --------------------
COPY ./scripts/*.sh $ScriptsDir/

# install dependecies
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install mc && \ 
    apt-get -y install vim && \
	apt-get -y install wget && \
	apt-get -y install subversion && \ 
	apt-get -y install build-essential


# compile and install fpc
RUN $ScriptsDir/install_fpcsource.sh && \
    $ScriptsDir/install_fpcbootstrap.sh && \
    $ScriptsDir/install_fpc.sh Lin64

ENTRYPOINT ["/opt/bin/fpc/bin/fpc"]
