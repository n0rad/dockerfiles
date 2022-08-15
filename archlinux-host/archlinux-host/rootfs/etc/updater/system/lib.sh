
function echo_green {
  echo -e "\033[0;32m$*\033[0m"
}

function apply_package_reflector {
	pacman -Qi reflector &> /dev/null || pacman -S reflector --noconfirm
	reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
}

function apply_package_yay {
	# yay dependencies
	pacman -Qi wget gcc git grep &> /dev/null || pacman -S wget base-devel git --noconfirm

	# renovate: datasource=github-tags depName=Jguer/yay
	YAY_VERSION=v11.2.0
	yay --version | cut -f1 -d- | grep ${YAY_VERSION} > /dev/null || {
		cd /tmp
		wget https://github.com/Jguer/yay/releases/download/${YAY_VERSION}/yay_${YAY_VERSION#v*}_x86_64.tar.gz
		tar xvzf yay_${YAY_VERSION#v*}_x86_64.tar.gz
		cp yay_${YAY_VERSION#v*}_x86_64/yay /usr/bin
		cd / 
		rm -Rf /tmp/yay*
	}
	grep "PKGEXT='.pkg.tar'" /etc/makepkg.conf || sed -i -- "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar'/g" /etc/makepkg.conf
	grep 'yay:' /etc/passwd > /dev/null || echo "yay:x:20002:20002:yay:/var/lib/yay:/usr/bin/sh" >> /etc/passwd
	grep 'yay:' /etc/group > /dev/null || echo "yay:x:20002:" >> /etc/group
	grep 'yay:' /etc/shadow > /dev/null || echo "yay:x:20002::::::" >> /etc/shadow
	mkdir -p /var/lib/yay && chown yay: /var/lib/yay
	cat > /etc/sudoers.d/yay <<-EOF
		Cmnd_Alias  PACMAN = /usr/bin/pacman, /usr/bin/yay
		%yay ALL=(ALL) NOPASSWD: PACMAN
	EOF
}

function apply_packages {
	for i in $1; do
		pacman -Qi $i &> /dev/null || su -c "yay -S $i --noconfirm" yay
	done
}

function apply_default_packages {
	# remove iptables to use nft
	pacman -Qi "iptables-nft" &> /dev/null || pacman -Rdd --noconfirm "iptables"

	apply_packages " \
		syslinux linux intel-ucode systemd-sysvcompat efibootmgr
		gptfdisk hdparm mdadm dosfstools xfsprogs
		linux-headers dkms
		openssh smartmontools
		pciutils usbutils net-tools bind-tools conntrack-tools
		iptables-nft ethtool socat iputils iproute2
		sudo grep curl wget downgrade
		htop iftop lsof dfc psmisc ncdu tree nmon
		vim tmux
	"
}

function system_update {
	echo_green "Updating package list:"
	pacman -Sy

	echo_green "Updating mirror list:"
	apply_package_reflector

	echo_green "Preparing arch keys:"
	pacman-key --init
	pacman -S --noconfirm archlinux-keyring

	echo_green "Updating installed packages:"
	pacman -Su --noconfirm
 
	echo_green "Updating yay:"
	apply_package_yay

	echo_green "Installing default packages:"
	apply_default_packages

	echo_green "Installing packages:"
	[ -z "$1" ] || apply_packages "$1"
}
