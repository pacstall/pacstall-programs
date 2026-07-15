pkgname="nano"
arch=("any")
pkgver="9.1"
license=("GPL-3.0")
source=("@${pkgname}~${pkgver}::https://nano-editor.org/dist/v${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
makedepends=("libncurses-dev" "groff" "autoconf" "make" "automake" "autopoint" "gcc" "gettext" "git" "pkg-config" "texinfo")
pkgdesc="Free replacement for the Pico text editor"
sha256sums=("5f47764274cb7532349ce0aa20ec10f1e8e851a6e9fa3eb66812c43d196db042")
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
