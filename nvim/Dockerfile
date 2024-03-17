# base image
# ---------------
FROM xwin

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts \
	VSCodeURL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" \
	PowerShellURL="https://github.com/PowerShell/PowerShell/releases/download/v7.2.1/powershell_7.2.1-1.deb_amd64.deb"
# Install scripts
# --------------------
COPY ./scripts/* $ScriptsDir/

RUN apt-get update && \
	apt-get install -y git
	apt-get install -y neovim

# Install Xwindows files
# ----------------------
RUN cp $ScriptsDir/.xsessionrc /root/ && \
    cp $ScriptsDir/system.jwmrc /etc/jwm/
