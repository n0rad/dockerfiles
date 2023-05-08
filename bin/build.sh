#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

PUSH="${PUSH:-false}"
path=$PWD
[ -z "$1" ] || path="$(cd "$1" && pwd)"
name=${path##*/}
idFile=$(mktemp)

echo_bright_red "Building $name:"
docker buildx build --platform=linux/amd64,linux/arm64 --no-cache --iidfile=$idFile -t "n0rad/$name:latest" "$path"

if [ "$PUSH" = true ]; then
    echo_bright_red "Pushing $name:"
    tag="1.$(date -u '+%y%m%d').$(date -u '+%H%M' | awk '{print $0+0}')-H$(git rev-parse --short HEAD)"
    docker buildx tag $(cat $idFile | cut -f2 -d:) "n0rad/$name:$tag"
    docker buildx push "n0rad/$name:latest"
    docker buildx push "n0rad/$name:$tag"
fi
