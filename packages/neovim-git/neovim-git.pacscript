name="neovim-git"
url="https://github.com/neovim/neovim.git"
description="Neovim is a project that seeks to aggressively refactor Vim source code"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
depends="ninja-build gettext libtool-bin autoconf automake cmake g++ pkg-config unzip"
pkgver() {
    git ls-remote "${url}" master | cut -f1 
}
version="${pkgver}"

build() {
    make -j$(nproc)
}

install() {
    sudo make install DESTDIR=/usr/src/pacstall/neovim-git
}
# vim:set ft=sh ts=2 sw=2 et:
