
function apply_package_reflector {
	pacman -Qi reflector &> /dev/null || pacman -S reflector --noconfirm
	reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
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
	# remove iptables to use nft
	pacman -Qi "iptables-nft" &> /dev/null || pacman -Rdd --noconfirm "iptables"

	for i in $1; do
		pacman -Qi $i &> /dev/null || su -c "yay -S $i --noconfirm" yay
	done
}

function apply_default_packages {
	apply_packages " \
		syslinux linux intel-ucode systemd-sysvcompat efibootmgr
		gptfdisk hdparm mdadm dosfstools xfsprogs
		linux-headers dkms
		openssh smartmontools
		pciutils usbutils net-tools bind-tools conntrack-tools
		iptables-nft ethtool socat iputils iproute2
		sudo grep curl wget downgrade
		htop iftop lsof dfc psmisc ncdu tree nmon iotop
		vim tmux
	"
}

function system_update {
	# update package list
	pacman -Sy

	# make sure keys are ok
	pacman-key --init
	pacman -S --noconfirm archlinux-keyring

	# make sure all already installed packages are up to date
	pacman -Su --noconfirm

	apply_package_reflector
	apply_package_yay
	apply_default_packages
	[ -z "$1" ] || apply_packages "$1"
}
