name="yafetch-git"
gives="yafetch"
breaks="${gives}-deb ${gives}-bin ${gives}-app ${gives}-git"
url="https://github.com/Henryws/yafetch.git"
description="Yet another fetch tool"
maintainer="Henryws <hwengerstickel@pm.me>"
pkgdir="${STOWDIR}/${name}"
pkgver() {
  git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 yafetch "${pkgdir}/usr/bin/yafetch"
}
