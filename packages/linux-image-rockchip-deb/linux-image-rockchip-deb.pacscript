pkgname="linux-image-rockchip-deb"
pkgver="6.18.55"
basever="6.18"
buildver="1"
gives="linux-image-${basever}-rockchip"
source=("https://repo.mobian.org/pool/main/l/linux-${basever}-rockchip/${gives}_${pkgver}-${buildver}_arm64.deb")
sha256sums=("316d1772955844983e8209915eaef82e84b699b9f5c0c5e32be8439b81fb0019")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Linux kernel image files built for PINE64 Rockchip devices (Mobian)"
arch=('arm64')
repology=("project: linux" "repo: aur" "srcname: linux-mainline" "binname: linux-mainline")
pacdeps=("linux-headers-rockchip-deb")
if [[ -f "/boot/u-boot-rockchip.bin" ]]; then
  pacdeps+=("bes2600-firmware-git")
fi
depends=("initramfs-tools")
pacdeps_ubuntu=("firmware-brcm80211-deb")
depends_debian=("firmware-brcm80211")
