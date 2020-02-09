#!/bin/bash
/lib/systemd/systemd-udevd &
udevadm trigger

startx -- :$DockerXDisplay $DockerXTerminal
