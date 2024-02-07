name="neovim-git"
gives="neovim"
url="https://github.com/neovim/neovim.git"
pkgver="0.9.1"
homepage='https://neovim.io/'
pkgdesc="Vim fork maintained by the community"
maintainer="Elsie19 <elsie19@pm.me>"
makedepends=("ninja-build" "gettext" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config" "unzip")
breaks=("neovim-bin" "neovim" "neovim-app" "neovim-deb")
pkgver() {
  git ls-remote "${url}" master | head -n1 | cut -f1 | cut -c1-8
}

build() {
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
