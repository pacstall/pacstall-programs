name="linux-headers-rockchip-deb"
version="6.3"
pointver=".13"
gives="linux-headers-${version}-rockchip"
url="https://repo.mobian-project.org/pool/main/l/linux-${version}-rockchip/${gives}_${version}${pointver}+rockchip-1_arm64.deb"
hash="c94c66942fb2cd54eaf9a445fe26d46a0b392469ef85317dcef0df89da1b04b9"
maintainer="Oren Klopfer <oren@taumoda.com>"
description="Linux kernel header files built for PineTab2 (Mobian kernel)"
arch=('arm64')

preinst() {
    fancy_message warn "This package is deprecated, please switch to ${BBlue}linux-headers-okpine-deb${NC}"
}
