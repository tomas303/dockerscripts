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
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb \
  -O /opt/packages-microsoft-prod.deb --progress=dot:giga && \
	apt -y install /opt/packages-microsoft-prod.deb && \
	rm /opt/packages-microsoft-prod.deb && \
	apt update && \
	apt install -y apt-transport-https && \
	apt install -y dotnet-sdk-8.0 && \
	dotnet workload update
# vscode
RUN wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/019f4d1419fbc8219a181fab7892ebccf7ee29a2/code_1.87.0-1709078641_amd64.deb \
  -O /opt/vscode.deb --progress=dot:giga && \
	apt -y install /opt/vscode.deb && \
	rm /opt/vscode.deb && \
	apt update
# powershell
RUN  wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/powershell_7.4.1-1.deb_amd64.deb \
  -O /opt/powershell.deb --progress=dot:giga && \
	apt -y install /opt/powershell.deb && \
	rm /opt/powershell.deb && \
	apt update






