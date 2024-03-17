#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	podman build -f Dockerfile -t fsharp .
elif [ "$cmd" = "1" ]; then
	podman build -f Dockerfile.1 -t fsharp1 .
elif [ "$cmd" = "2" ]; then
	podman build -f Dockerfile.2 -t fsharp2 .
elif [ "$cmd" = "3" ]; then
	podman build -f Dockerfile.3 -t fsharp3 .
fi