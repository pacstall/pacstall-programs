name="linux-image-okpine-deb"
pkgver="6.7.0"
gives="linux-image-${pkgver}-okpine"
url="https://github.com/oklopfer/debs/raw/master/kernel/${pkgver}/${gives}_${pkgver}-1_arm64.deb"
hash="3fc5e63ebe45f5fbf49a6299676fe3b0fecbb18b54256fae7d7da7732e934ec2"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Linux kernel image files built for Pine64 devices"
arch=('arm64')
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
pacdeps=("linux-headers-okpine-deb")
if [[ -d "/lib/firmware/bes2600" ]]; then
  pacdeps+=("bes2600-firmware-git")
fi
depends=("busybox-initramfs" "initramfs-tools" "initramfs-tools-bin" "initramfs-tools-core" "klibc-utils" "libklibc")
