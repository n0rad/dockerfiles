#!/bin/bash
set -e
set -x
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh

# remove iptables if installed so iptables-nft can be installed along kubelet
pacman --noconfirm -Rdd iptables || true

system_update  " \
    haveged
    open-iscsi nfs-utils rsync
    ipset ipvsadm
    cri-o crictl cni-plugins  
    kubelet kubectl kubeadm
    nvidia-container-toolkit nvidia-470xx-dkms
"

# replace iptables-nft with iptables legacy because of bug
pacman --noconfirm -Rdd iptables-nft && pacman --noconfirm -S iptables
