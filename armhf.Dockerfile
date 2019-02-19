FROM balenalib/armv7hf-alpine
LABEL maintainer="Jason Wilder <mail@jasonwilder.com>"

ENV VERSION 0.7.4
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-armhf-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN [ "cross-build-start" ]
RUN apk -U add openssl && wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin
RUN [ "cross-build-end" ]

ENTRYPOINT ["/usr/local/bin/docker-gen"]
