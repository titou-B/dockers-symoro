#!/bin/sh

if [ -z "$1" ]; then
	echo "no arg"
	docker run -ti --rm \
	-e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        symoro /bin/sh
else
	docker run -it --rm \
	-e DISPLAY=$1:0.0 \
	-v /tmp/.X11-unix:$1:/tmp/.X11-unix \
	symoro /bin/sh
fi
