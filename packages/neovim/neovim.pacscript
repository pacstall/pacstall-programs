name="neovim"
pkgname="neovim"
version="0.7.2"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
build_depends="gettext libtool autoconf automake cmake g++ pkg-config unzip build-essential"
gives="nvim"
replace="nvim neovim-runtime"
description="Neovim is a vim fork maintained by the comunity"
hash="ccab8ca02a0c292de9ea14b39f84f90b635a69282de38a6b4ccc8565bc65d096"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
repology=("project: ${name}")

prepare() {
    true
}

build() {
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr -j"$(nproc)"
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/${pkgname}
    sudo install -Dm644 "LICENSE.txt" -t "/usr/src/pacstall/${pkgname}/usr/share/licenses/${pkgname}"
    sudo install -Dm644 "README.md" -t "/usr/src/pacstall/${pkgname}/usr/share/doc/${pkgname}"
}

removescript() {
    sudo rm -rf "/usr/share/licenses/${pkgname}"
    sudo rm -rf "/usr/share/doc/${pkgname}"
}
