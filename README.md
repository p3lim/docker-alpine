# [Alpine Linux](https://hub.docker.com/r/p3lim/alpine)

This is a base image for [Docker](https://www.docker.com/) that contains [Alpine Linux](https://alpinelinux.org/).  
It uses [s6-overlay](https://github.com/just-containers/s6-overlay) as a process supervisor.

### Environment variables

- `PUID` - UID for the program to run as (defaults to `911`)
- `PGID` - GID for the program to run as (defaults to `911`)
- `TZ` - Time zone used for the logs (defaults to `Europe/Paris`)
