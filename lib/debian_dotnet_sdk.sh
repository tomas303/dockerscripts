#!/bin/bash
set -e

DEBIAN_VERSION=$(awk -F'.' '{print $1}' /etc/debian_version)
wget "https://packages.microsoft.com/config/debian/$DEBIAN_VERSION/packages-microsoft-prod.deb" \
    -O /opt/packages-microsoft-prod.deb --progress=dot:giga && \
    apt -y install /opt/packages-microsoft-prod.deb && \
    rm /opt/packages-microsoft-prod.deb && \
    apt update && \
    apt install -y apt-transport-https && \
    apt install -y dotnet-sdk-8.0 && \
    # apt install -y powershell && \
    dotnet workload update

