pkgname="linux-image-okpine-deb"
pkgver="6.7.1"
gives="linux-image-${pkgver}-okpine"
source=("https://github.com/oklopfer/debs/raw/master/kernel/${pkgver}/${gives}_${pkgver}-1_arm64.deb")
sha256sums=("e5c423411f654e3017a2704ce1564d6b299317161584852f02d0ee01850b4407")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Linux kernel image files built for Pine64 devices"
arch=('arm64')
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
pacdeps=("linux-headers-okpine-deb")
if [[ -f "/boot/u-boot-rockchip.bin" ]]; then
  pacdeps+=("bes2600-firmware-git")
fi
depends=("busybox-initramfs" "initramfs-tools" "initramfs-tools-bin" "initramfs-tools-core" "klibc-utils" "libklibc")
