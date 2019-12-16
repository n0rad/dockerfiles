#!/usr/bin/env sh
set -x

UID="${UID:-0}"
GID="${GID:-0}"
PORT="${PORT:-22}"

# sync and unmount on shutdown
trap cleanup SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

cleanup() {
  echo -n "Caught signal. Cleaning up now... "
  sync
  umount -vl /mount
  echo "Done!"
  exit 0
}

sshfs -f \
    -o reconnect \
    -o ServerAliveInterval=15 \
    -o ServerAliveCountMax=3 \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -o IdentityFile=${IDENTITY_FILE} \
    -o allow_other \
    -o auto_unmount \
    -o uid="$UID" \
    -o gid="$GID" \
    -o port="$PORT" \
    "$@" /mount
