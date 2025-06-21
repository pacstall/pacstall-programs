pkgname="nano"
arch=("any")
pkgver="8.5"
license=("GPL-3.0")
source=("@${pkgname}~${pkgver}::https://nano-editor.org/dist/v${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
makedepends=("libncurses-dev" "groff" "autoconf" "make" "automake" "autopoint" "gcc" "gettext" "git" "pkg-config" "texinfo")
pkgdesc="Free replacement for the Pico text editor"
sha256sums=("000b011d339c141af9646d43288f54325ff5c6e8d39d6e482b787bbc6654c26a")
repology=("project: nano")

prepare() {
  cd "${pkgname}~${pkgver}"
  ./configure
}

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
