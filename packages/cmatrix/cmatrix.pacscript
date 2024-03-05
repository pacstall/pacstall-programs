name="cmatrix"
pkgver="2.0"
source=("https://github.com/abishekvashok/${name}/releases/download/v${pkgver}/${name}-v${pkgver}-Butterscotch.tar")
makedepends=("autoconf" "make")
depends=("libncurses5-dev" "libncursesw5-dev")
pkgdesc="Terminal based The Matrix like implementation"
hash=("e46c739bfe79e570db2461f89ac66ea79a8fab8efb8423ab53f143e93c2553bc")
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  ./configure
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${name}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${name}"
}

post_remove() {
  sudo rm -rf "/usr/share/licenses/${name}"
  sudo rm -rf "/usr/share/doc/${name}"
}
