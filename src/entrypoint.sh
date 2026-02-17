#!/bin/sh
set -eu
set -x

: USER_UID=$USER_UID
: USER_GID=$USER_GID
: USER_NAME=$USER_NAME
: USER_GROUP=$USER_GROUP

#HOME_DIR="/home/$USER_NAME"

INITIALIZED=/entrypoint.sh.initialized

if [ ! -f "$INITIALIZED" ]; then

    existing_user=$(getent passwd "$USER_NAME" | cut -d: -f1)
    existing_group=$(getent group "$USER_GID" | cut -d: -f1)

    if [ -n "$existing_user" -a "$existing_user" != "$USER_NAME" ]; then
        userdel "$existing_user"
    fi

    if [ -n "$existing_group" ]; then
        useradd -u "$USER_UID" -g "$existing_group" -m "$USER_NAME"
    else
        groupadd -g "$USER_GID" "$USER_GROUP"
        useradd -u "$USER_UID" -g "$USER_GID" -m "$USER_NAME"
    fi
    touch "$INITIALIZED"
fi

echo "===== My Ubuntu Container Image ====="
exec /usr/sbin/gosu "$USER_NAME" "$@"
