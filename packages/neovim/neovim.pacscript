name="neovim"
pkgname="neovim"
version="0.6.1"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
build_depends="gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential"
gives="nvim"
replace="nvim"
description="Neovim is a vim fork maintained by the comunity"
hash="dd882c21a52e5999f656cae3f336b5fc702d52addd4d9b5cd3dc39cfff35e864"

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
