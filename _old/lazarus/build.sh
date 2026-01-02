#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t lazarus .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t lazone .
elif [ "$cmd" = "2" ]; then
	podman build -f Dockerfile.2 -t laztwo .
elif [ "$cmd" = "3" ]; then
	podman build -f Dockerfile.3 -t lazthree .
elif [ "$cmd" = "4" ]; then
	podman build -f Dockerfile.4 -t lazfour .
elif [ "$cmd" = "5" ]; then
	podman build -f Dockerfile.5 -t lazfive .
elif [ "$cmd" = "6" ]; then
	podman build -f Dockerfile.6 -t lazsix .
fi