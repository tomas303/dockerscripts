#!/bin/bash
set -e

DEB_URL=$(wget -qO- https://api.github.com/repos/go-task/task/releases/latest | \
    grep "browser_download_url.*amd64.deb" | \
    cut -d '"' -f 4) && \
    echo "Latest is $DEB_URL" && \
    wget -O /opt/task.deb "$DEB_URL" && \
    apt-get install -y /opt/task.deb && \
    rm /opt/task.deb