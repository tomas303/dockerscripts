# base image
# ---------------
FROM ubuntu:latest

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
  apt -y install unzip && \
  apt -y install gnupg && \
  apt -y install neovim && \
  apt -y install ripgrep

# Download some dependecies
# -------------------------
RUN wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CommitMono.zip" \
  -O /opt/vscode.deb --progress=dot:mega
