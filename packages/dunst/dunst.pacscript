name="dunst"
version="1.9.2"
url="https://github.com/dunst-project/dunst/archive/refs/tags/v${version}.tar.gz"
build_depends=("libdbus-1-dev" "libxinerama1" "libxrandr2" "libxss1" "libxss-dev" "libgtk-3-dev" "libnotify-dev")
description="A highly configurable and lightweight notification daemon"
hash="fa6ce45c0af4bae188b0d679a5ba92f8f9b7e4301bb1bb476e82df26bce9e71a"
maintainer="Henryws <hwengerstickel@pm.me>"
repology=("project: ${name}")

build() {
  make -j"$(nproc)"
}

install() {
  sudo make install -j"$(nproc)" DESTDIR="${pkgdir}"
}
