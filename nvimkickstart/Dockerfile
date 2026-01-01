FROM registry.opensuse.org/opensuse/distrobox:latest

# ENV USER=dev
# ENV HOME=/home/dev

# Base tooling only
RUN zypper --non-interactive refresh \
    && zypper --non-interactive update \
    && zypper --non-interactive install \
    git \
    curl \
    wget \
    unzip \
    ripgrep \
    fd \
    python3 \
    python3-pip \
    gcc \
    gcc-c++ \
    make \
    cmake \
    ninja \
    gettext-tools \
    libtool \
    pkg-config \
    ca-certificates \
    nodejs \
    && zypper clean -a

# Install Neovim AppImage system-wide (NO FUSE, NO HOME)
RUN curl -L \
      https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.appimage \
      -o /tmp/nvim.appimage && \
    chmod +x /tmp/nvim.appimage && \
    cd /opt && \
    /tmp/nvim.appimage --appimage-extract && \
    mv squashfs-root /opt/nvim && \
    ln -s /opt/nvim/AppRun /usr/local/bin/nvim && \
    rm /tmp/nvim.appimage

# # Create user AFTER system install
# RUN useradd -m -s /bin/bash $USER
# USER $USER
# WORKDIR $HOME

# Bootstrap script (acts only on $HOME)
COPY bootstrap-nvim.sh /usr/local/bin/bootstrap-nvim.sh
COPY nvim.desktop /opt/nvim.desktop
