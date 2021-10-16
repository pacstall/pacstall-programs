name="suru-icon-theme-git"
gives="suru-icon-theme"
version="0.1"
maintainer="aranym <aranym1@pm.me>"
url="https://github.com/snwh/${name}.git"
build_depends="meson ninja-build"
description="Revitalization of the Suru icon set designed for Ubuntu Touch"

prepare() {
    true
}

build() {
    meson "build" --prefix=/usr/src/pacstall/suru-icon-theme-git/usr
}

install() {
    sudo ninja -C "build" install > /dev/null
}
