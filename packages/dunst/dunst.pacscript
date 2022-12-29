name="dunst"
version="1.9.0"
url="https://github.com/dunst-project/dunst/archive/refs/tags/v${version}.tar.gz"
build_depends="libdbus-1-dev libxinerama1 libxrandr2 libxss1 libxss-dev libgtk-3-dev libnotify-dev"
description="A highly configurable and lightweight notification daemon"
hash="b7b8d7d6560bb241b1e4d37eba770cdf19b9d5dbfc1d4d47572ad676f3f7c98a"
maintainer="Henryws <hwengerstickel@pm.me>"
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install -j"$(nproc)" DESTDIR="${pkgdir}"
}
