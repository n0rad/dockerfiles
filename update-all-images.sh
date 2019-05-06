#!/bin/bash
# simple script to update all images
set -x
set -e

PUSH="${PUSH:-false}"

for i in $(find -mindepth 2 -maxdepth 2 -type d | sed -e 's/\.\///' | grep -v ^.git | sort); do
    name=${i##*/}
    echo -e "\e[101mBuilding $name :\e[0;m"
    currentDate=$(date '+%Y%m%d.%H%M%S')
    idFile=$(mktemp)
    
    docker build --no-cache --iidfile=$idFile -t "n0rad/$name:latest" "$i"

    if [ $PUSH == true ]; then
        tag=$currentDate-$(cat $idFile | cut -f2 -d: | cut -c1-8)
        docker tag $(cat $idFile | cut -f2 -d:) "n0rad/$name:$tag"
        echo -e "\e[101mPushing $name :\e[0;m"
        docker push "n0rad/$name:latest"
        docker push "n0rad/$name:$tag"
        rm $idFile
    fi
done
