pkgname="linux-image-rockchip-deb"
pkgver="6.18.44"
basever="6.18"
buildver="1"
gives="linux-image-${basever}-rockchip"
source=("https://repo.mobian.org/pool/main/l/linux-${basever}-rockchip/${gives}_${pkgver}-${buildver}_arm64.deb")
sha256sums=("30acef51a86c2030bdc61592a7381953ef7ad618342c4d23cd1838e86906ead5")
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
