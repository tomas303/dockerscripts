#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t asvim .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t asvim1 .
elif [ "$cmd" = "2" ]; then
	podman build -f Dockerfile.2 -t asvim2 .
elif [ "$cmd" = "3" ]; then
	podman build -f Dockerfile.3 -t asvim3 .
fi