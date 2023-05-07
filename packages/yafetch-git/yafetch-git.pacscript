name="yafetch-git"
gives="yafetch"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
url="https://github.com/Henryws/yafetch.git"
description="Yet another fetch tool"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgver() {
  git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master .
}
version="$(pkgver)"

install() {
  sudo install -Dm755 yafetch "${pkgdir}/usr/bin/yafetch"
}
