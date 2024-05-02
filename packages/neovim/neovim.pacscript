pkgname="neovim"
pkgver="0.9.5"
source=("https://github.com/neovim/neovim/archive/refs/tags/v${pkgver}.tar.gz")
homepage='https://neovim.io/'
makedepends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replaces=("neovim" "nvim" "neovim-runtime")
pkgdesc="Neovim is a vim fork maintained by the community"
sha256sums=("fe74369fc30a32ec7a086b1013acd0eacd674e7570eb1acc520a66180c9e9719")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${pkgname}")

build() {
  cd "${_archive}"
  make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
