#!/bin/bash
set -eu
set -x

DOCKER_IMAGE="$1"
shift

DOCKER_CMD="${DOCKER_CMD:-docker}"
RUN=("${DOCKER_CMD}" "run" "--rm" "--init")

if [ -t 0 ]; then
    # stdin is TTY
    RUN+=("-it")
else
    RUN+=("-i")
fi

RUN+=("--hostname" "test-ghcr")
RUN+=("-v" "${HOME}:/home/"$(id -un)"/HOST_HOME/:rw")
RUN+=("--env" "USER_UID="$(id -u))
RUN+=("--env" "USER_GID="$(id -g))
RUN+=("--env" "USER_NAME="$(id -un))
RUN+=("--env" "USER_GROUP="$(id -gn))

exec "${RUN[@]}" "$DOCKER_IMAGE" "$@"
