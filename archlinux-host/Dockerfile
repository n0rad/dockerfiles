FROM n0rad/archlinux

RUN pacman --noconfirm -Syu \
    ntp \
    openssh \
    linux \
    syslinux \
    systemd-sysvcompat \
    gptfdisk \
    usbutils \
    pciutils

RUN systemctl enable \
    sshd.service \
    ntpd.service





arch-chroot /mnt mkinitcpio -p linux
arch-chroot /mnt syslinux-install_update -aim

# the user
arch-chroot /mnt useradd -m -g users -G wheel ${newuser}
mkdir /mnt/home/${newuser}/.ssh
touch /mnt/home/${newuser}/.ssh/authorized_keys
chmod 700 /mnt/home/${newuser}/.ssh
chmod 600 /mnt/home/${newuser}/.ssh/authorized_keys
cat <<EOF > /mnt/home/${newuser}/.ssh/authorized_keys
${newuser_pubkey}
EOF
arch-chroot /mnt chown -R ${newuser}:users /home/${newuser}/.ssh
arch-chroot /mnt passwd -d ${newuser} # just in case
arch-chroot /mnt chsh -s /bin/zsh ${newuser}

# enable only user
arch-chroot /mnt passwd -l root
cat <<EOF > /mnt/etc/sudoers.d/wheel
%wheel ALL=(ALL) ALL
EOF

# clock TODO
arch-chroot /mnt hwclock --systohc --utc
arch-chroot /mnt pacman --noconfirm -S ntp
arch-chroot /mnt ntpdate ${NTP_SERVER}
sed -i 's/^server/#server/g' ${MOUNT_PATH}/etc/ntp.conf
echo "server ${NTP_SERVER}" >> ${MOUNT_PATH}/etc/ntp.conf
arch-chroot /mnt systemctl enable ntpd.service



arch-chroot /mnt systemctl enable multi-user.target sshd systemd-networkd systemd-resolved # haveged
ln -sf /run/systemd/resolve/resolv.conf /mnt/etc/resolv.conf
