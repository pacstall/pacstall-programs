name="linux-image-rockchip-deb"
version="6.3"
pointver=".13"
gives="linux-image-${version}-rockchip"
url="https://repo.mobian-project.org/pool/main/l/linux-${version}-rockchip/${gives}_${version}${pointver}+rockchip-1_arm64.deb"
hash="bdc03e445cac6969c897a48c22510546dd9a2908320f10d79f451af9bfa1e545"
maintainer="Oren Klopfer <oren@taumoda.com>"
description="Linux kernel image files built for PineTab2 (Mobian kernel)"
arch=('arm64')
pacdeps=("linux-headers-rockchip-deb")

preinst() {
    fancy_message warn "This package is deprecated, please switch to ${BBlue}linux-image-okpine-deb${NC}"
}
