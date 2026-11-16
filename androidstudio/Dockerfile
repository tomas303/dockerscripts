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
    libxkbfile1 \
    libsm6 \
    libice6 \
    libpng16-16 \
    libexpat1 \
    libxfixes3 \
    libx11-xcb1 \
    libxcb-cursor0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-sync1 \
    libxcb-util1 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xinput0 \
    libxcb-xkb1 \
    libxcb-glx0 \
    libxcb-dri3-0 \
    libxcb-present0 \
    libxshmfence1 \
    libegl1 \
    libglu1-mesa \
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

# Default Android SDK, downloaded by setup.sh into ~/Android/Sdk on first run
# (check https://developer.android.com/studio#command-line-tools-only for newer cmdline-tools)
ENV ANDROID_CMDLINE_TOOLS_URL=https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
ENV ANDROID_SDK_PACKAGES="platform-tools platforms;android-36 build-tools;36.0.0"

# skip the first-run Setup Wizard (standard/custom)
RUN echo 'disable.android.first.run=true' >> /opt/android-studio/bin/idea.properties

# desktop entry, so distrobox-export --app android-studio works
# (login shell, so ~/.profile with ANDROID_HOME is read and Studio finds the SDK;
#  cd ~ because launchers like rofi may start it in a cwd that exists only in the
#  container, which makes distrobox-host-exec (xdg-open -> browser) fail with 127)
RUN printf '%s\n' \
  '[Desktop Entry]' \
  'Version=1.0' \
  'Type=Application' \
  'Name=Android Studio' \
  'Exec=bash -lc "cd ~ && /opt/android-studio/bin/studio.sh %f"' \
  'Icon=/opt/android-studio/bin/studio.png' \
  'Categories=Development;IDE;' \
  'Terminal=false' \
  'StartupWMClass=jetbrains-studio' \
  > /usr/share/applications/android-studio.desktop
