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
  ./lib/debian_dotnet_sdk.sh \
  ./lib/debian_vscode.sh \
  ./lib/setup_default.sh \
  ./fsharp/setup.sh \
  ${ScriptsDir}/

RUN bash ${ScriptsDir}/debian_base_install.sh
RUN bash ${ScriptsDir}/debian_dotnet_sdk.sh
RUN bash ${ScriptsDir}/debian_vscode.sh

RUN apt -y install nodejs && \
  apt -y install npm 

