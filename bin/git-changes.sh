#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/color.sh

commitHash=HEAD~
if [ ! -z ${1+x} ] && [ ${1} != 'null' ]; then
    if git cat-file -e ${1}^{commit} 2>/dev/null ; then
        if git rev-list --all | grep -q ${1}; then
            commitHash=${1}
        else
            echo_red "Hash found : ${1}, but do not belong to rev-list. continue with HEAD~" 1>&2
        fi
    else
        echo_red "Hash not found : ${1}, probably push force. continue with HEAD~" 1>&2
    fi
fi

findDockerfilesFromFilePath() {
    local current=""
    for pathPart in ${1//// }; do
        current="${current}/${pathPart}"
        if [ -f "${current:1}/Dockerfile" ]; then
            echo ${current:1}
            return
        fi
    done
}

changes=($(git diff --name-status ${commitHash}))
toRun=()
toDelete=()

while [ ! -z "$changes" ]; do

    if [[ ${changes[0]} == "A" ]]; then
        echo_green "ADDED ${changes[1]}" 1>&2
        toRun+=($(findDockerfilesFromFilePath ${changes[1]}))
        changes=("${changes[@]:2}")
    elif [[ ${changes[0]} == "M" ]]; then
        echo_green "MODIFIED ${changes[1]}" 1>&2
        toRun+=($(findDockerfilesFromFilePath ${changes[1]}))
        changes=("${changes[@]:2}")
    elif [[ ${changes[0]} == "T" ]]; then
        echo_green "TYPE MODIFIED ${changes[1]}" 1>&2
        toRun+=($(findDockerfilesFromFilePath ${changes[1]}))
        changes=("${changes[@]:2}")
    elif [[ ${changes[0]} == "D" ]]; then
        echo_green "DELETED ${changes[1]}" 1>&2
        if [[ ${changes[1]} == *Jenkinsfile ]]; then
            toDelete+=($(dirname ${changes[1]}))
        else
            toRun+=($(findDockerfilesFromFilePath ${changes[1]}))
        fi
        changes=("${changes[@]:2}")
    elif [[ ${changes[0]:0:1} == "R" ]]; then
        echo_green "RENAMED ${changes[1]} ${changes[2]}" 1>&2
        if [[ ${changes[1]} == *Jenkinsfile ]]; then
            toDelete+=(${changes[1]})
        fi
        toRun+=($(findDockerfilesFromFilePath ${changes[2]}))
        changes=("${changes[@]:3}")
    else
        echo_red "Unknown git change ${i}" 1>&2
        exit 1
    fi

done

toRunUniq=($(echo "${toRun[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
for each in "${toRunUniq[@]}"
do
  echo "R:$each"
done

toDeleteUniq=($(echo "${toDelete[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
for each in "${toDeleteUniq[@]}"
do
  echo "D:$each"
done

