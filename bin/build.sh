#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

PUSH="${PUSH:-false}"
path=$PWD
[ -z "$1" ] || path="$(cd "$1" && pwd)"
name=${path##*/}
idFile=$(mktemp)

tag="1.$(date -u '+%y%m%d').$(date -u '+%H%M' | awk '{print $0+0}')-H$(git rev-parse --short HEAD)"
BUILD_ARGS="--platform=linux/amd64,linux/arm64/v8 --no-cache -t n0rad/$name:$tag -t n0rad/$name:latest"
if [ "$PUSH" = true ]; then
    echo_bright_red "Building $name:"
    docker buildx build $BUILD_ARGS "$path"
else
    echo_bright_red "Building / Pushing $name:"
    docker buildx build $BUILD_ARGS --push "$path"
fi
