name="kvantum"
pkgname="kvantum"
version="1.0.0"
url="https://github.com/tsujan/Kvantum/releases/download/V${version}/Kvantum-${version}.tar.xz"
license="GPL"
build_depends="g++ cmake"
depends="libx11-dev qtbase5-dev libqt5svg5-dev libqt5x11extras5-dev libkf5windowsystem-dev libxext-dev"
gives="kvantum"
breaks="qt5-style-kvantum"
description="Kvantum (by Pedram Pourang, a.k.a. Tsu Jan) is an SVG-based theme engine for Qt, tuned to KDE and LXQt, with an emphasis on elegance, usability and practicality."
hash="a3a5339705339ff946c5a0c436b9b33eaf8c14eeffcf20e085045e86f5f355cb"

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
