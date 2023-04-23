name="neovim-git"
gives="neovim"
url="https://github.com/neovim/neovim.git"
homepage='https://neovim.io/'
description="Vim fork maintained by the community"
maintainer="Henryws <hwengerstickel@pm.me>"
build_depends=("ninja-build" "gettext" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config" "unzip")
breaks=("neovim-bin" "neovim" "neovim-app" "neovim-deb")
pkgver() {
  git ls-remote "${url}" master | head -n1 | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
