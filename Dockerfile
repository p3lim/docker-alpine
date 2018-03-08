FROM alpine:3.7

ARG OVERLAY_VERSION='v1.21.4.0'

ENV PS1='$(pwd) $ '
ENV HOME='/root'

# common tools
RUN apk add --no-cache bash curl ca-certificates shadow coreutils tzdata

# install s6-overlay
RUN curl -Lo /tmp/s6-overlay-amd64.tar.gz https://github.com/just-containers/s6-overlay/releases/download/$OVERLAY_VERSION/s6-overlay-amd64.tar.gz
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# add s6 user and dirs
RUN groupmod -g 1000 users
RUN useradd -u 911 -Ud /config -s /bin/false abc
RUN usermod -G users abc
RUN mkdir -p /config /defaults /app

# cleanup
RUN rm -rf /tmp/*

# add local files
COPY root/ /

# default entrypoint
ENTRYPOINT ["/init"]
