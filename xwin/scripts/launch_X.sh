#!/bin/bash

#ENV TZ=America/Los_Angeles
#if [ -z "$TZ" ]
#then
#  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#fi

/lib/systemd/systemd-udevd &
udevadm trigger

startx -- :$DockerXDisplay $DockerXTerminal
