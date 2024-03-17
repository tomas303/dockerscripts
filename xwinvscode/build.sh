#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t vscode .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t vscode1 .
elif [ "$cmd" = "2" ]; then
	podman build -f Dockerfile.2 -t vscode2 .
elif [ "$cmd" = "3" ]; then
	podman build -f Dockerfile.3 -t vscode3 .
fi