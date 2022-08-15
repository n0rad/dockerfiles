#!/bin/bash
set -e
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh

system_update  " \
    haveged
    open-iscsi nfs-utils rsync
    ipset ipvsadm
    cri-o crictl cni-plugins  
    kubelet kubectl kubeadm
    nvidia-container-toolkit nvidia-470xx-dkms
"
