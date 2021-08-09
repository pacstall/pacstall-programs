name="fishui-git"
pkgname="fishui-git"
description="FishUI is a GUI library based on QQC2 (Qt Quick Controls 2), every Cutefish application uses it"
url="https://github.com/cutefishos/fishui.git"
build_depends="libqt5x11extras5-dev libkf5windowsystem-dev qtbase5-private-dev libxcb1-dev libxcb-shape0-dev libxcb-icccm4-dev"

pkgver() {
        git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    mkdir build
    cd build
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/fishui-git
}
