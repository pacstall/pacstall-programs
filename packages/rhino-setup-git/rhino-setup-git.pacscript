name="rhino-setup-git"
url="https://github.com/rhino-linux/rhino-setup.git"
build_depends="libgtk-4-dev libadwaita-1-dev gettext desktop-file-utils rustc cargo meson ninja-build"
depends="libgtk-4-dev libadwaita-1-dev gettext desktop-file-utils"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Sourajyoti Basak <wiz28@protonmail.com>, Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
    sudo meson build
}

install() {
    sudo DESTDIR="${pkgdir}" ninja -C build install
}
