name="dunst"
pkgname="dunst"
version="1.7.3"
url="https://github.com/dunst-project/dunst/archive/refs/tags/v${version}.tar.gz"
build_depends="libdbus-1-dev libxinerama1 libxrandr2 libxss1 libxss-dev libgtk-3-dev libnotify-dev"
gives="dunst"
replace="dunst"
description="A highly configurable and lightweight notification daemon."
hash="150c782690286e163663b0eb2605b733927240159738b8365808b851e0afbbee"

prepare() {
  true
}

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install -j"$(nproc)" DESTDIR=/usr/src/pacstall/dunst
}
