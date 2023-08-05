name="linux-image-rockchip-deb"
pkgver="6.3"
pointver=".13"
gives="linux-image-${pkgver}-rockchip"
url="https://repo.mobian-project.org/pool/main/l/linux-${pkgver}-rockchip/${gives}_${pkgver}${pointver}+rockchip-1_arm64.deb"
hash="bdc03e445cac6969c897a48c22510546dd9a2908320f10d79f451af9bfa1e545"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Linux kernel image files built for PineTab2 (Mobian kernel)"
arch=('arm64')
pacdeps=("linux-headers-rockchip-deb")

pre_install() {
  fancy_message warn "This package is deprecated, please switch to ${BBlue}linux-image-okpine-deb${NC}"
}
