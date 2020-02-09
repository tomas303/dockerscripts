#!/bin/bash

cmd=$1

if [ "$cmd" = "T" ]; then
	docker build -f Dockerfile -t kdevelop .
elif [ "$cmd" = "1" ]; then
	docker build -f Dockerfile.1 -t kdevelop1 .
elif [ "$cmd" = "2" ]; then
	docker build -f Dockerfile.2 -t kdevelop2 .
elif [ "$cmd" = "3" ]; then
	docker build -f Dockerfile.3 -t kdevelop3 .
fi