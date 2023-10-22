#!/bin/bash

# docker image rm jekyllghpages
# docker build -t jekyllghpages .

cmd=$1
podman build -f Dockerfile -t jekyllghpages .
