# base image
# ---------------
FROM debian:stable

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts 

# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/

# Install software
# --------------------
RUN apt update && apt -y upgrade && \
  apt -y install mc && \ 
  apt -y install git && \
  apt -y install wget && \
  apt -y install gnupg && \
  apt -y install nodejs && \
  apt -y install npm
# .net sdk
RUN DEBIAN_VERSION=$(awk -F'.' '{print $1}' /etc/debian_version) && \
    wget "https://packages.microsoft.com/config/debian/$DEBIAN_VERSION/packages-microsoft-prod.deb" \
    -O /opt/packages-microsoft-prod.deb --progress=dot:giga && \
    apt -y install /opt/packages-microsoft-prod.deb && \
    rm /opt/packages-microsoft-prod.deb && \
    apt update && \
    apt install -y apt-transport-https && \
    apt install -y dotnet-sdk-8.0 && \
    apt install -y powershell && \
    dotnet workload update
# vscode
RUN wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" \
  -O /opt/vscode.deb --progress=dot:giga && \
	apt -y install /opt/vscode.deb && \
	rm /opt/vscode.deb && \
	apt update
