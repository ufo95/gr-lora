#!/bin/sh
xhost +SI:localuser:root

DOCKER_XAUTH=/tmp/.docker.xauth
sudo touch /tmp/.docker.xauth
sudo xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $DOCKER_XAUTH nmerge -
sudo docker run -i -t --rm --privileged -e DISPLAY=$DISPLAY -e XAUTHORITY=$DOCKER_XAUTH -v /tmp/.docker.xauth:/tmp/.docker.xauth:ro -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /dev/bus/usb:/dev/bus/usb --mount type=bind,source="PATH TO GRLORA ON HOST/gr-lora",target=/src/apps/persistent --entrypoint /bin/bash --ipc=host --env=DISPLAY=$DISPLAY rpp0/gr-lora:latest

