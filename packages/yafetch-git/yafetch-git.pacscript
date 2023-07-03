name="yafetch-git"
gives="yafetch"
breaks=("${gives}-deb" "${gives}-bin" "${gives}-app" "${gives}-git")
url="https://github.com/Henryws/yafetch.git"
description="Yet another fetch tool"
maintainer="Elsie19 <hwengerstickel@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

package() {
  sudo install -Dm755 yafetch "${pkgdir}/usr/bin/yafetch"
}
