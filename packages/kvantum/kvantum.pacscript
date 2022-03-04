name="kvantum"
pkgname="kvantum"
version="1.0.1"
url="https://github.com/tsujan/Kvantum/releases/download/V${version}/Kvantum-${version}.tar.xz"
license="GPL"
build_depends="g++ cmake"
depends="libx11-dev qtbase5-dev libqt5svg5-dev libqt5x11extras5-dev libkf5windowsystem-dev libxext-dev"
gives="kvantum"
breaks="qt5-style-kvantum"
description="Kvantum (by Pedram Pourang, a.k.a. Tsu Jan) is an SVG-based theme engine for Qt, tuned to KDE and LXQt, with an emphasis on elegance, usability and practicality."
hash="f7e4530f86544531313fab10267d934b7fa2d5a946b7dd26b2181001f0f8cae0"

prepare() {
          cd Kvantum
          mkdir build && cd build
}

build() {
        cmake ..
        make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/kvantum
}
