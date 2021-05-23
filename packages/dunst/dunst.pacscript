name="dunst"
pkgname="dunst"
url="https://github.com/dunst-project/dunst/archive/refs/tags/v1.6.1.tar.gz"
version="1.6.1"
build_depends="libdbus-1-dev libxinerama1 libxrandr2 libxss1 \
    libxss-dev libgtk-3-dev libnotify-dev"
gives="dunst dunstctl dunstify"
breaks=""
description="A highly configurable and lightweight notification daemon."

prepare() {
    true
}

build() {
    make -j$(nproc)
}

install() {
    sudo make install -j$(nproc) DESTDIR=/usr/src/pacstall/dunst
}

