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


# rustup override set nightly

# Install software
# --------------------
RUN apt update && apt -y upgrade && \
  apt -y install mc && \ 
  apt -y install git && \
	apt -y install wget && \
	apt -y install curl && \
	apt -y install gnupg && \
	apt -y install libsqlite3-dev
	
# vscode
RUN wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/019f4d1419fbc8219a181fab7892ebccf7ee29a2/code_1.87.0-1709078641_amd64.deb \
  -O /opt/vscode.deb --progress=dot:giga && \
	apt -y install /opt/vscode.deb && \
	rm /opt/vscode.deb && \
	apt update

