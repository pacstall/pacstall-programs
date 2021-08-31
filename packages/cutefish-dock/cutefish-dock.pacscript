name="cutefish-dock"
pkgname="cutefish-dock"
version="0.3-1"
url="https://github.com/cutefishos/dock.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev libqt5x11extras5-dev libkf5windowsystem-dev"
depends="fishui libcutefish libqt5svg5-dev"
description="CutefishOS application dock."

pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    mkdir build
    cd build
}

build() {
    cmake ..
    make -j$(nproc)
}

install() {
    make install DESTDIR=/usr/src/pacstall/cutefish-dock
}
