pkgname="cmatrix"
pkgver="2.0"
source=("https://github.com/abishekvashok/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-Butterscotch.tar")
makedepends=("autoconf" "make")
depends=("libncurses5-dev" "libncursesw5-dev")
pkgdesc="Terminal based The Matrix like implementation"
sha256sums=("e46c739bfe79e570db2461f89ac66ea79a8fab8efb8423ab53f143e93c2553bc")
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${_archive}"
  ./configure
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
