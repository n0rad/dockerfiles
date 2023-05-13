#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

PUSH="${PUSH:-false}"
path=$PWD
[ -z "$1" ] || path="$(cd "$1" && pwd)"
name=${path##*/}
idFile=$(mktemp)
platform="linux/amd64,linux/arm64"
platformLabel=$(cat "$path/Dockerfile" | grep -i "^label " | awk -F "[ =]*" '{print $2 " " $3}' | grep -w "platform" | cut -d' ' -f2 | sed -e 's/[" ]*//g' | head -n1 || true)
if [ "$platformLabel" != "" ]; then
    platform="$platformLabel"
fi

tag="1.$(date -u '+%y%m%d').$(date -u '+%H%M' | awk '{print $0+0}')-H$(git rev-parse --short HEAD)"
BUILD_ARGS="--platform=$platform --no-cache -t n0rad/$name:$tag -t n0rad/$name:latest"
if [ "$PUSH" = true ]; then
    echo_bright_red "Building $name:$tag"
    docker buildx build $BUILD_ARGS "$path"
else
    echo_bright_red "Building / Pushing $name:$tag"
    docker buildx build $BUILD_ARGS --push "$path"
fi
