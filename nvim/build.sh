#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t nvim .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t nvim1 .
elif [ "$cmd" = "2" ]; then
	podman build -f Dockerfile.2 -t nvim2 .
elif [ "$cmd" = "3" ]; then
	podman build -f Dockerfile.3 -t nvim3 .
fi