name="neovim"
pkgver="0.9.4"
url="https://github.com/neovim/neovim/archive/refs/tags/v${pkgver}.tar.gz"
homepage='https://neovim.io/'
makedepends=("gettext" "libtool" "libtool-bin" "autoconf" "automake" "cmake" "g++" "pkg-config")
replace=("neovim" "nvim" "neovim-runtime")
pkgdesc="Neovim is a vim fork maintained by the community"
hash="148356027ee8d586adebb6513a94d76accc79da9597109ace5c445b09d383093"
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
