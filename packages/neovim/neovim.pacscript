name="neovim"
version="0.8.2"
url="https://github.com/neovim/neovim/archive/refs/tags/v${version}.tar.gz"
build_depends="gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip build-essential"
replace="neovim nvim neovim-runtime"
description="Neovim is a vim fork maintained by the community"
hash="c516c8db73e1b12917a6b2e991b344d0914c057cef8266bce61a2100a28ffcc9"
maintainer="Henryws <hwengerstickel@pm.me>"
repology=("project: ${name}")

build() {
    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${pkgdir}"
    sudo install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript() {
    sudo rm -rf "/usr/share/licenses/${pkgname}"
    sudo rm -rf "/usr/share/doc/${pkgname}"
}
