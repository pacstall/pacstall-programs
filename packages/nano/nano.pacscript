pkgname="nano"
arch=("any")
pkgver="8.7"
license=("GPL-3.0")
source=("@${pkgname}~${pkgver}::https://nano-editor.org/dist/v${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
makedepends=("libncurses-dev" "groff" "autoconf" "make" "automake" "autopoint" "gcc" "gettext" "git" "pkg-config" "texinfo")
pkgdesc="Free replacement for the Pico text editor"
sha256sums=("afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9")
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
