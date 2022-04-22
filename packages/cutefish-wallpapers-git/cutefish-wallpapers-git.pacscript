name="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
version="0.2-1"
url="https://github.com/cutefishos/wallpapers.git"
license="GPL-3.0"
build_depends="cmake ninja-build"
description="CutefishOS's system wallpaper."

pkgver() {
    git ls-remote "${url}" main | cut -f1 | cut -c1-8
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
    sudo make install DESTDIR=/usr/src/pacstall/cutefish-wallpapers-git
}
