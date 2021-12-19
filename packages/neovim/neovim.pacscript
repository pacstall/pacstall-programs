name="neovim"
pkgname="neovim"
version="0.6.0"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
build_depends="gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential"
gives="nvim"
replace="nvim"
description="Neovim is a vim fork maintained by the comunity"
hash="2cfd600cfa5bb57564cc22ffbbbcb2c91531053fc3de992df33656614384fa4c"

prepare() {
    true
}

build() {
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr -j"${nproc}"
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/${pkgname}
    sudo install -Dm644 "LICENSE" -t "/usr/src/pacstall/${pkgname}/usr/share/licenses/${pkgname}"
    sudo install -Dm644 "README.md" -t "/usr/src/pacstall/${pkgname}/usr/share/doc/${pkgname}"
}

removescript() {
    sudo rm -rf "/usr/share/licenses/${pkgname}"
    sudo rm -rf "/usr/share/doc/${pkgname}"
}
