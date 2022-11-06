#!/bin/bash
set -e
set -x
readonly SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $SCRIPT_PATH/lib.sh

# remove iptables to use nft
# pacman -Qi "iptables-nft" &> /dev/null || pacman -Rdd --noconfirm "iptables"

# remove iptables if installed so iptables-nft can be installed along kubelet
pacman --noconfirm -Rdd iptables && pacman --noconfirm -Sy iptables-nft

system_update  " \
    haveged
    open-iscsi nfs-utils rsync
    ipset ipvsadm
    cri-o crictl cni-plugins runc
    kubelet kubectl kubeadm
    nvidia-container-toolkit nvidia-470xx-dkms
"

# replace iptables-nft with iptables legacy because of bug
pacman --noconfirm -Rdd iptables-nft && pacman --noconfirm -S iptables
