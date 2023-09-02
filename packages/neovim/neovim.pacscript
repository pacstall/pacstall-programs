name="neovim"
pkgver="0.9.1"
url="https://github.com/neovim/neovim/archive/refs/tags/v${pkgver}.tar.gz"
homepage='https://neovim.io/'
makedepends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replace=("neovim" "nvim" "neovim-runtime")
pkgdesc="Neovim is a vim fork maintained by the community"
hash="8db17c2a1f4776dcda00e59489ea0d98ba82f7d1a8ea03281d640e58d8a3a00e"
maintainer="Elsie19 <elsie19@pm.me>"
repology=("project: ${name}")

build() {
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
}
