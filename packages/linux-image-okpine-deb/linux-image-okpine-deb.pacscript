pkgname="linux-image-okpine-deb"
pkgver="6.9.0"
gives="linux-image-${pkgver}-okpine"
source=("https://github.com/oklopfer/debs/raw/master/kernel/${pkgver}/${gives}_${pkgver}-1_arm64.deb")
sha256sums=("095588349ea52dbdf942751ddf618ded9219e89b1172d0481add8060e3f32828")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Linux kernel image files built for Pine64 devices"
arch=('arm64')
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
pacdeps=("linux-headers-okpine-deb")
if [[ -f "/boot/u-boot-rockchip.bin" ]]; then
  pacdeps+=("bes2600-firmware-git")
fi
depends=("busybox-initramfs" "initramfs-tools" "initramfs-tools-bin" "initramfs-tools-core" "klibc-utils" "libklibc")
