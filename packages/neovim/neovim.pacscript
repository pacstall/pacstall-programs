name="neovim"
pkgname="neovim"
version="5.0.0"
url="https://github.com/neovim/neovim/archive/refs/tags/v0.5.0.tar.gz"
build_depends="gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential"
depends=""
optdepends=()
gives="nvim"
replace="nvim"
description="Neovim is a vim fork maintained by the comunity"
hash="2294caa9d2011996499fbd70e4006e4ef55db75b99b6719154c09262e23764ef"

prepare() {
    true
}

build() {
    sudo make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr/src/pacstall/neovim

}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/neovim
}
