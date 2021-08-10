name="cutefish-launcher"
pkgname="cutefish-launcher"
version="0.2-1"
url="https://github.com/cutefishos/launcher.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev"
depends="fishui libcutefish libkf5windowsystem-dev"
description="CutefishOS's full-screen application launcher"

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
    sudo make install DESTDIR=/usr/src/pacstall/cutefish-launcher
}
