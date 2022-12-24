name="kvantum"
pkgname="kvantum"
version="1.0.7"
url="https://github.com/tsujan/Kvantum/releases/download/V${version}/Kvantum-${version}.tar.xz"
license="GPL"
build_depends="g++ cmake libx11-dev qtbase5-dev libqt5svg5-dev libqt5x11extras5-dev libkf5windowsystem-dev libxext-dev"
gives="kvantum"
breaks="qt5-style-kvantum"
description="SVG-based theme engine for Qt"
incompatible=('debian:bullseye')
hash="43172e913ef4e275758092fbe76735ab5607182e344337a83a8c8ff616d79d7f"

build() {
    cd Kvantum
    mkdir build && cd build
    cmake ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR="${pkgdir}"
}
