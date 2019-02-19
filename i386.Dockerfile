FROM balenalib/i386-alpine
LABEL maintainer="Jason Wilder <mail@jasonwilder.com>"

ENV VERSION 0.7.4
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-linux-i386-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN apk -U add openssl && wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/docker-gen"]
