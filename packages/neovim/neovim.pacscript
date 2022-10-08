name="neovim"
pkgname="neovim"
version="0.8.0"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
build_depends="gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential"
gives="nvim"
replace="nvim neovim-runtime"
description="Neovim is a vim fork maintained by the comunity"
hash="505e3dfb71e2f73495c737c034a416911c260c0ba9fd2092c6be296655be4d18"
maintainer="Henryws <hwengerstickel@pm.me>"
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
