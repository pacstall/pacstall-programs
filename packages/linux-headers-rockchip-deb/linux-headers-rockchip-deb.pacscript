name="linux-headers-rockchip-deb"
pkgver="6.3"
pointver=".13"
gives="linux-headers-${pkgver}-rockchip"
url="https://repo.mobian-project.org/pool/main/l/linux-${pkgver}-rockchip/${gives}_${pkgver}${pointver}+rockchip-1_arm64.deb"
hash="c94c66942fb2cd54eaf9a445fe26d46a0b392469ef85317dcef0df89da1b04b9"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgdesc="Linux kernel header files built for PineTab2 (Mobian kernel)"
arch=('arm64')

pre_install() {
  fancy_message warn "This package is deprecated, please switch to ${BBlue}linux-headers-okpine-deb${NC}"
}
