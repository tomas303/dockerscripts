#!/bin/bash
set -e

wget "https://go.dev/dl/go1.24.2.linux-amd64.tar.gz" \
  -O /opt/go.tar.gz --progress=dot:giga && \
  tar -C /usr/local -xzf /opt/go.tar.gz && \
  rm /opt/go.tar.gz
