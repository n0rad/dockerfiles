#!/bin/bash -x
# simple script to update all images

PUSH="${PUSH:-false}"

for i in $(ls -d */ | sort); do
  if [ "$i" != "arch/" ]; then
    echo -e "\e[101mBuilding ${i%%/} :\e[0;m"
    docker build -t "n0rad/${i%%/}" "$i"
    if [ ${PUSH} == true ]; then
      echo -e "\e[101mPushing ${i%%/} :\e[0;m"
      docker push "n0rad/${i%%/}"
    fi
  fi
done
