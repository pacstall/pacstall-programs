pkgname="neovim-git"
gives="neovim"
source=("https://github.com/neovim/neovim.git")
pkgver="0.9.1"
homepage='https://neovim.io/'
pkgdesc="Vim fork maintained by the community"
maintainer=("Elsie19 <elsie19@pm.me>")
makedepends=("ninja-build" "gettext" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config" "unzip")
breaks=("neovim-bin" "neovim" "neovim-app" "neovim-deb")

build() {
  cd "${_archive}"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
