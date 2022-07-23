#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

PUSH="${PUSH:-false}"

for i in $($DIR/git-changes.sh); do
    if [[ "$i" == R:* ]]; then
        name=${i##*:}
        currentDate=$(date '+%Y%m%d.%H%M%S')
        idFile=$(mktemp)

        echo_bright_red "Building $name:"
        docker build --no-cache --iidfile=$idFile -t "n0rad/$name:latest" "$i"

        if [ "$PUSH" = true ]; then
            echo_bright_red "Pushing $name:"
            tag="1.$(date '+%Y%m%d').$(date '+%H%M%S')-$(git rev-parse --short HEAD)"
            docker tag $(cat $idFile | cut -f2 -d:) "n0rad/$name:$tag"
            docker push "n0rad/$name:latest"
            docker push "n0rad/$name:$tag"
        fi
    fi
done

