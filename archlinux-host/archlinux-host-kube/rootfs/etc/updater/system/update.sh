#!/bin/bash
set -e
set -x
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh

system_update  " \
    open-iscsi nfs-utils rsync
    xfsprogs
    ipset ipvsadm
    cri-o crictl cni-plugins runc
    kubelet kubectl kubeadm
    nvidia-container-toolkit nvidia-470xx-dkms
"
