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
docker build --no-cache --iidfile=$idFile -t "n0rad/$name:latest" "$path"

if [ "$PUSH" = true ]; then
    echo_bright_red "Pushing $name:"
    tag="1.$(date -u '+%y%m%d').$(date -u '+%H%M' | xargs printf '%d')-H$(git rev-parse --short HEAD)"
    docker tag $(cat $idFile | cut -f2 -d:) "n0rad/$name:$tag"
    docker push "n0rad/$name:latest"
    docker push "n0rad/$name:$tag"
fi
