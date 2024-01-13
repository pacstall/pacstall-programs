name="linux-image-okpine-deb"
pkgver="6.7.0"
gives="linux-image-${pkgver}-okpine"
url="https://github.com/oklopfer/debs/raw/master/kernel/${pkgver}/${gives}_${pkgver}-1_arm64.deb"
hash="b51f573bbe20668872d13471f5cb9fec04d3276324a7028cea43ee5061e01a7d"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Linux kernel image files built for Pine64 devices"
arch=('arm64')
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
pacdeps=("linux-headers-okpine-deb")
if [[ -f "/boot/u-boot-rockchip.bin" ]]; then
  pacdeps+=("bes2600-firmware-git")
fi
depends=("busybox-initramfs" "initramfs-tools" "initramfs-tools-bin" "initramfs-tools-core" "klibc-utils" "libklibc")
