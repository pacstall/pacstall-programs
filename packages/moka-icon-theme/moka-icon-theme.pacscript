name="moka-icon-theme"
version="5.4.0"
maintainer="aranym <aranym1@pm.me>"
url="https://codeload.github.com/snwh/moka-icon-theme/tar.gz/refs/tags/v5.4.0"
build_depends="meson ninja-build"
description="Moka is a stylized FreeDesktop icon set, created with simplicity in mind."
hash="b32e82aea4358e087620e852aa20042e791aa957a93de568da1d2223a46c7cd9"

prepare() {
    true
}

build() {
    meson "build" --prefix=/usr/src/pacstall/moka-icon-theme/usr
}

install() {
    sudo ninja -C "build" install > /dev/null
}
