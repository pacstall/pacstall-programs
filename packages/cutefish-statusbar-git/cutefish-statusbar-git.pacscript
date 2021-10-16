name="cutefish-statusbar-git"
gives="cutefish-statusbar"
version="0.3-1"
url="https://github.com/cutefishos/statusbar.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build qttools5-dev-tools qtbase5-dev qtdeclarative5-dev qtquickcontrols2-5-dev qttools5-dev"
depends="fishui libcutefish libdbusmenu-qt5-dev libqt5svg5-dev"
description="Top status bar of CutefishOS"

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
    sudo make install DESTDIR=/usr/src/pacstall/cutefish-statusbar-git
}
