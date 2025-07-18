# base image
# ---------------
FROM debian:stable

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts

RUN mkdir -p ${ScriptsDir}

# Install scripts
# --------------------
COPY \ 
  ./lib/funcs.sh \
  ./lib/debian_base_install.sh \
  ./lib/debian_vscode.sh \
  ./lib/debian_go.sh \
  ./lib/setup_default.sh \
  ./go/setup.sh \
  ${ScriptsDir}/

RUN bash ${ScriptsDir}/debian_base_install.sh
RUN bash ${ScriptsDir}/debian_vscode.sh
RUN bash ${ScriptsDir}/debian_go.sh


RUN apt -y install default-jre && \
  apt -y install build-essential

# Add go to PATH
ENV PATH="/usr/local/go/bin:${PATH}"

