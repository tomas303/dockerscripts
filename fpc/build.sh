#!/bin/bash

# docker image rm fpc
# docker build -t fpc .

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t fpc .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t fpcone .
elif [ "$cmd" = "2" ]; then
	podman build -f Dockerfile.2 -t fpctwo .
elif [ "$cmd" = "3" ]; then
	podman build -f Dockerfile.3 -t fpcthree .
elif [ "$cmd" = "4" ]; then
	podman build -f Dockerfile.4 -t fpcfour .
fi