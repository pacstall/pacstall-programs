name="cutefish-wallpapers"
pkgname="cutefish-wallpapers"
version="0.2-1"
url="https://github.com/cutefishos/wallpapers.git"
license="GPL-3.0"
build_depends="cmake ninja-build"
description="CutefishOS's system wallpaper."

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
    make install DESTDIR=/usr/src/pacstall/cutefish-wallpapers
}

