name="rhino-setup-git"
url="https://github.com/rhino-linux/rhino-setup.git"
build_depends="libgtk-4-dev libadwaita-1-dev gettext desktop-file-utils rustc cargo meson ninja-build"
gives="rhino-setup"
description="Rhino Linux Setup Prompt"
maintainer="Wizard28 (+oklopfer)"
pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
    meson build
    ninja -C build
}

install() {
    sudo DESTDIR="${pkgdir}" ninja -C build install
}