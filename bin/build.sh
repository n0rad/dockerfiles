#!/bin/bash
set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

PUSH="${PUSH:-false}"
CACHE="${CACHE:-true}"
path=$PWD

[ -z "$1" ] || path="$(cd "$1" && pwd)"
name=${path##*/}
platform="linux/amd64,linux/arm64"
platformLabel=$(cat "$path/Dockerfile" | grep -i "^label " | awk -F "[ =]*" '{print $2 " " $3}' | grep -w "platform" | cut -d' ' -f2 | sed -e 's/[" ]*//g' | head -n1 || true)
if [ "$platformLabel" != "" ]; then
    platform="$platformLabel"
fi
cache=
if [ "$CACHE" != true ]; then
  cache="--no-cache"
fi

tag="1.$(date -u '+%y%m%d').$(date -u '+%H%M' | awk '{print $0+0}')-H$(git rev-parse --short HEAD)"
rootImage="n0rad/$name:$tag"

for p in ${platform//,/ } ; do
  buildArgs="--platform=$p $cache --build-arg=ARCH=${p#*/} -t "$rootImage-${p#*/}"  --build-arg=TAG=$tag"
  echo_bright_red "Build $rootImage-${p#*/}"
  docker buildx build $buildArgs "$path" --load
done

if [ "$PUSH" == true ]; then
  for p in ${platform//,/ } ; do
    echo_bright_red "Push $rootImage-${p#*/}"
    docker push "$rootImage-${p#*/}"
    pushArgs+=" --amend $rootImage-${p#*/}"
  done

  echo_bright_red "Push manifest $rootImage"
  docker manifest create "$rootImage" $pushArgs
  docker manifest push -p "$rootImage"

  echo_bright_red "Push manifest n0rad/$name:latest"
  docker manifest create "n0rad/$name:latest" $pushArgs
  docker manifest push -p "n0rad/$name:latest"
fi
