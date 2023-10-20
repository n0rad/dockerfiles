#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

PUSH="${PUSH:-false}"
LOAD="${LOAD:-false}"
BUILDX_FLAGS="${BUILDX_FLAGS:-}"
path=$PWD

[ -z "$1" ] || path="$(cd "$1" && pwd)"
name=${path##*/}
platform="linux/amd64,linux/arm64"
platformLabel=$(cat "$path/Dockerfile" | grep -i "^label " | awk -F "[ =]*" '{print $2 " " $3}' | grep -w "platform" | cut -d' ' -f2 | sed -e 's/[" ]*//g' | head -n1 || true)
if [ "$platformLabel" != "" ]; then
    platform="$platformLabel"
fi
nocache=
if [ "$PUSH" == true ]; then
	nocache="--no-cache"
fi

tag="1.$(date -u '+%y%m%d').$(date -u '+%H%M' | awk '{print $0+0}')-H$(git rev-parse --short HEAD)"
buildArgs="$nocache --platform=$platform -t n0rad/$name:$tag -t n0rad/$name:latest --build-arg=TAG=$tag $load $BUILDX_FLAGS"

if [ "$PUSH" == true ]; then
  echo_bright_red "Building / Pushing $name:$tag"
  docker buildx build $buildArgs --push "$path"
else
  load=
  if [ "$LOAD" == true ]; then
    load="--load"
  fi
  echo_bright_red "Building $name:$tag"
  docker buildx build $buildArgs $load "$path"
fi


# build images separately, push when all ok and unify them in a manifest
# this is not working correctly because each image must be pushed priorly with his own tag (*-$ARCH) and this breaks sumver version order
# This could be fixed using https://github.com/docker/cli/issues/3350#issuecomment-1437165524, use buildx to create manifest from local images hashes
#rootImage="n0rad/$name:$tag"
#for p in ${platform//,/ } ; do
#  buildArgs="--platform=$p $cache --build-arg=ARCH=${p#*/} -t "$rootImage-${p#*/}"  --build-arg=TAG=$tag $load"
#  echo_bright_red "Build $rootImage-${p#*/}"
#  docker buildx build $buildArgs "$path"
#done
#
#if [ "$PUSH" == true ]; then
#  for p in ${platform//,/ } ; do
#    echo_bright_red "Push $rootImage-${p#*/}"
#    docker push "$rootImage-${p#*/}"
#    pushArgs+=" --amend $rootImage-${p#*/}"
#  done
#
#  echo_bright_red "Push manifest $rootImage"
#  docker manifest create "$rootImage" $pushArgs
#  docker manifest push -p "$rootImage"
#
#  echo_bright_red "Push manifest n0rad/$name:latest"
#  docker manifest create "n0rad/$name:latest" $pushArgs
#  docker manifest push -p "n0rad/$name:latest"
#fi
