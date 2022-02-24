name="dunst"
pkgname="dunst"
version="1.8.0"
url="https://github.com/dunst-project/dunst/archive/refs/tags/v${version}.tar.gz"
build_depends="libdbus-1-dev libxinerama1 libxrandr2 libxss1 libxss-dev libgtk-3-dev libnotify-dev"
gives="dunst"
replace="dunst"
description="A highly configurable and lightweight notification daemon."
hash="1ec0c7552bb26f4bc24624053f12a022fde128c63952213c40df9d679e0b7a5b"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  true
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install -j"$(nproc)" DESTDIR=/usr/src/pacstall/dunst
}
