name="dunst"
version="1.9.1"
url="https://github.com/dunst-project/dunst/archive/refs/tags/v${version}.tar.gz"
build_depends="libdbus-1-dev libxinerama1 libxrandr2 libxss1 libxss-dev libgtk-3-dev libnotify-dev"
description="A highly configurable and lightweight notification daemon"
hash="571d82d5feef995e69a35e708a400a0cfa12a0f81854c5a3357e17844bf6249a"
maintainer="Henryws <hwengerstickel@pm.me>"
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install -j"$(nproc)" DESTDIR="${pkgdir}"
}
