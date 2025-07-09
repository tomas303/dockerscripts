#!/bin/bash
set -e

wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" \
  -O /opt/vscode.deb --progress=dot:giga && \
	apt -y install /opt/vscode.deb && \
	rm /opt/vscode.deb && \
	apt update

