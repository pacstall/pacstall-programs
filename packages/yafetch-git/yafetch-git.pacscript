name="yafetch-git"
gives="yafetch"
url="https://github.com/Henryws/yafetch.git"
description="Yet another fetch tool"
maintainer="Henryws <hwengerstickel@pm.me>"
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
  sudo install -Dm755 yafetch "/usr/src/pacstall/yafetch-git/usr/bin/yafetch"
}
