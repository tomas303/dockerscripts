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
COPY ./setup.sh $ScriptsDir/


# Install software
# --------------------
RUN apt update && apt -y upgrade && \
  apt -y install tar && \
  apt -y install mc && \
  apt -y install git && \
  apt -y install wget && \
  apt -y install gnupg && \
  apt -y install default-jre && \
  apt -y install build-essential

# vscode
RUN wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" \
  -O /opt/vscode.deb --progress=dot:giga && \
  apt -y install /opt/vscode.deb && \
  rm /opt/vscode.deb && \
  apt update

# go
RUN wget "https://go.dev/dl/go1.24.2.linux-amd64.tar.gz" \
  -O /opt/go.tar.gz --progress=dot:giga && \
  tar -C /usr/local -xzf /opt/go.tar.gz && \
  rm /opt/go.tar.gz

# Add go to PATH
ENV PATH="/usr/local/go/bin:${PATH}"

RUN go install -v github.com/go-delve/delve/cmd/dlv@latest
