#!/bin/bash
# simple script to update all images
set -x
set -e

PUSH="${PUSH:-false}"

for i in $(find -mindepth 2 -maxdepth 2 -type d | sed -e 's/\.\///' | grep -v ^.git | sort); do
    name=${i##*/}
    echo -e "\e[101mBuilding ${name} :\e[0;m"
    current=$(date '+%Y%m%d.%H%M%S')
    docker build --no-cache -t "n0rad/${name}:latest" -t "n0rad/${name}:${current}" "$i"
    if [ ${PUSH} == true ]; then
      echo -e "\e[101mPushing ${name} :\e[0;m"
      docker push "n0rad/${name}:latest"
      docker push "n0rad/${name}:${current}"
    fi
done
