name="rhino-setup-git"
url="https://github.com/rhino-linux/rhino-setup.git"
build_depends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils" "rustc" "cargo" "meson" "ninja-build")
depends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils")
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver() {
  mkdir tempcount git clone -q --filter=tree:0git clone -q --filter=tree:0 cd tempcount git clone -q --filter=tree:0git clone -q --filter=tree:0 git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master .
}
version="$(pkgver)"

build() {
  sudo meson build
}

install() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
