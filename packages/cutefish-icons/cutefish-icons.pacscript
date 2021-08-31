name="cutefish-icons"
pkgname="cutefish-icons"
version="0.3-1"
url="https://github.com/cutefishos/icons.git"
license="GPL-3.0"
build_depends="extra-cmake-modules ninja-build"
description="System default icon theme of CutefishOS."

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
    make install DESTDIR=/usr/src/pacstall/cutefish-icons
}
