# base image
# ---------------
FROM debian:stable

# Maintainer
# ----------
LABEL org.opencontainers.image.authors="tomashorak@post.cz"

# Environment variables
# -------------------------------------------------------------
ENV ScriptsDir=/opt/scripts

# Android Studio package (check https://developer.android.com/studio for newer)
ARG ANDROID_STUDIO_URL=https://edgedl.me.gvt1.com/android/studio/ide-zips/2026.2.2.9/android-studio-rabbit2-patch1-linux.tar.gz

RUN mkdir -p ${ScriptsDir}

# Install scripts
# --------------------
COPY \
  ./lib/funcs.sh \
  ./lib/debian_base_install.sh \
  ./lib/debian_task.sh \
  ./lib/setup_default.sh \
  ./androidstudio/setup.sh \
  ${ScriptsDir}/

RUN bash ${ScriptsDir}/debian_base_install.sh
RUN bash ${ScriptsDir}/debian_task.sh

# libraries for Android Studio (bundled JBR is used as JDK) and the emulator
RUN apt-get update && \
  apt-get -y install \
    unzip \
    zip \
    curl \
    build-essential \
    fontconfig \
    libfreetype6 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxkbcommon-x11-0 \
    libgbm1 \
    libgl1 \
    libnss3 \
    libasound2 \
    libpulse0 \
    libdbus-1-3 \
    libsecret-1-0 \
    usbutils \
    android-sdk-platform-tools-common && \
  rm -rf /var/lib/apt/lists/*

# install Android Studio into /opt/android-studio
RUN wget "${ANDROID_STUDIO_URL}" -O /opt/android-studio.tar.gz --progress=dot:giga && \
  tar -xzf /opt/android-studio.tar.gz -C /opt && \
  rm /opt/android-studio.tar.gz

# desktop entry, so distrobox-export --app android-studio works
RUN printf '%s\n' \
  '[Desktop Entry]' \
  'Version=1.0' \
  'Type=Application' \
  'Name=Android Studio' \
  'Exec=/opt/android-studio/bin/studio.sh %f' \
  'Icon=/opt/android-studio/bin/studio.png' \
  'Categories=Development;IDE;' \
  'Terminal=false' \
  'StartupWMClass=jetbrains-studio' \
  > /usr/share/applications/android-studio.desktop
