name="neovim-git"
gives="neovim"
url="https://github.com/neovim/neovim.git"
description="Neovim is a project that seeks to aggressively refactor Vim source code"
maintainer="Henryws <hwengerstickel@pm.me>"
build_depends="ninja-build gettext libtool-bin autoconf automake cmake g++ pkg-config unzip"
breaks="neovim-bin neovim neovim-app neovim-deb"
pkgver() {
  git ls-remote "${url}" master | head -n1 | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  make CMAKE_BUILD_TYPE=Release
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
