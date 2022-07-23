#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh


for i in $($DIR/git-changes.sh 2> /dev/null); do
    if [[ "$i" == R:* ]]; then
        name=${i##*:}
        currentDate=$(date '+%Y%m%d.%H%M%S')
        idFile=$(mktemp)

        echo_bright_red "Building $name:"
        echo docker build --no-cache --iidfile=$idFile -t "n0rad/$name:latest" "$i"

        echo_bright_red "Pushing $name:"
        tag="1.$(date '+%Y%m%d').$(date '+%H%M%S')-$(git rev-parse --short HEAD)"
        echo docker tag $(cat $idFile | cut -f2 -d:) "n0rad/$name:$tag"
        echo docker push "n0rad/$name:latest"
        echo docker push "n0rad/$name:$tag"
    fi
done

