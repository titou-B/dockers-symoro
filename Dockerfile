FROM alpine:3.7

ARG SERVICE_USER=developer
ARG SERVICE_HOME=/home/developer

RUN \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  apk add --no-cache \
    dbus-x11 \
    dumb-init \
    firefox-esr \
    mesa-gl \
    mesa-dri-swrast \
    ttf-freefont

RUN apk --no-cache add --update bash git python python-dev py-pip build-base

#for pillow needed by wxPython
RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev gtk+3.0-dev

RUN pip install --no-cache-dir sympy==0.7.3 \
  && pip install --no-cache-dir numpy==1.6.1 \
  && pip install --no-cache-dir PyOpenGL==3.0.1b2 \
  && pip install --no-cache-dir pathlib2
#RUN pip install --no-cache-dir wxPython

RUN cd ${SERVICE_HOME} \
  && git clone https://github.com/symoro/symoro.git

#USER    ${SERVICE_USER}
#WORKDIR ${SERVICE_HOME}
#VOLUME  ${SERVICE_HOME}

CMD /usr/bin/bash
