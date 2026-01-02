# base image
# ---------------
FROM registry.opensuse.org/opensuse/distrobox:latest

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
  ./asvim/setup.sh \
  ${ScriptsDir}/

# Install software
# --------------------
RUN zypper --non-interactive refresh && \
    zypper --non-interactive update && \
    zypper --non-interactive install \
        tar \
        mc \
        git \
        wget \
        gpg2 \
        unzip \
        neovim \
        ripgrep


# Download some dependecies
# -------------------------
RUN wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CommitMono.zip" \
  -O /opt/vscode.deb --progress=dot:mega
