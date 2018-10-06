FROM alpine:3.7

# version label
ARG OVERLAY_VERSION='v1.21.4.0'
LABEL overlay_version="$OVERLAY_VERSION"

# sensible environment
ENV PS1='$(pwd) $ '
ENV HOME='/root'

# common tools
RUN apk add --no-cache bash curl ca-certificates shadow coreutils tzdata

# install s6-overlay
RUN curl -Lo /tmp/s6-overlay.tar.gz https://github.com/just-containers/s6-overlay/releases/download/$OVERLAY_VERSION/s6-overlay-amd64.tar.gz
RUN tar xzf /tmp/s6-overlay.tar.gz -C /
RUN rm /tmp/s6-overlay.tar.gz

# create supervisor user with fallback IDs
RUN groupmod -g 1000 users
RUN useradd -u 911 -Ud /config -s /bin/false abc
RUN usermod -G users abc

# create exposed directories
RUN mkdir -p /config /logs /data

# copy local files
COPY root/ /

# set default entrypoint
ENTRYPOINT ["/init"]
