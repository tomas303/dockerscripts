#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t xwin .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t xwinone .
fi