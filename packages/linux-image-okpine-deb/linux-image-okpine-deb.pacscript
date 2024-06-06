pkgname="linux-image-okpine-deb"
pkgver="6.9.0"
pkgrel="2"
gives="linux-image-${pkgver}-okpine"
source=("https://github.com/oklopfer/debs/raw/master/kernel/${pkgver}/${gives}_${pkgver}-1_arm64.deb")
sha256sums=("60cf364f4977bd1cfb94d64cc62368940ec61e08743af3a75f58e2e4f0e3ce16")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Linux kernel image files built for Pine64 devices"
arch=('arm64')
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
pacdeps=("linux-headers-okpine-deb")
if [[ -f "/boot/u-boot-rockchip.bin" ]]; then
  pacdeps+=("bes2600-firmware-git")
fi
depends=("initramfs-tools")
