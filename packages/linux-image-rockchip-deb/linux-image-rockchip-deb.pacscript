pkgname="linux-image-rockchip-deb"
pkgver="6.18.16"
basever="6.18"
buildver="1"
gives="linux-image-${basever}-rockchip"
source=("https://repo.mobian.org/pool/main/l/linux-${basever}-rockchip/${gives}_${pkgver}-${buildver}_arm64.deb")
sha256sums=("7e89db0e16f93793a6deecd4269f6451df3285475bedc9fc15add6d9e311d9f6")
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
