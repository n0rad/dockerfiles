#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMIT="${COMMIT:-HEAD^}"

for i in $($DIR/git-changes.sh $COMMIT); do
    if [[ "$i" == R:* ]]; then
        $DIR/build.sh ${i##*:}
    fi
done
