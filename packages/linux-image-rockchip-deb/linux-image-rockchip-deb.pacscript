pkgname="linux-image-rockchip-deb"
pkgver="6.18.26"
basever="6.18"
buildver="1"
gives="linux-image-${basever}-rockchip"
source=("https://repo.mobian.org/pool/main/l/linux-${basever}-rockchip/${gives}_${pkgver}-${buildver}_arm64.deb")
sha256sums=("8a5a1168cd5f6fefd2e566c7a5e58714146ef7f7db9326d9ff538bbc4e606cac")
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
