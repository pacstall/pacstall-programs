name="neovim"
pkgname="neovim"
version="0.7.0"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
build_depends="gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential"
gives="nvim"
replace="nvim neovim-runtime"
description="Neovim is a vim fork maintained by the comunity"
hash="792a9c55d5d5f4a5148d475847267df309d65fb20f05523f21c1319ea8a6c7df"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
repology=("project: ${name}")

prepare() {
    true
}

build() {
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr -j"${nproc}"
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
