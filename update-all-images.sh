#!/bin/bash
# simple script to update all images
set -x
set -e

PUSH="${PUSH:-false}"

for i in $(ls -d */ | sort); do
  if [ "$i" != "arch/" ]; then
    echo -e "\e[101mBuilding ${i%%/} :\e[0;m"
    current=$(date '+%Y%m%d.%H%M%S')
    docker build --no-cache -t "n0rad/${i%%/}:latest" -t "n0rad/${i%%/}:${current}" "$i"
    if [ ${PUSH} == true ]; then
      echo -e "\e[101mPushing ${i%%/} :\e[0;m"
      docker push "n0rad/${i%%/}:latest"
      docker push "n0rad/${i%%/}:${current}"
    fi
  fi
done
