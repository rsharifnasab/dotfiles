#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
	/usr/bin/docker "$@"
else
	sudo /usr/bin/docker "$@"
fi
