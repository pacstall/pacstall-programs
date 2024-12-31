pkgname="nano"
major_version="7"
arch=("any")
pkgver="7.2"
license="GPL3"
source=("@${pkgname}~${pkgver}::https://nano-editor.org/dist/v${major_version}/${pkgname}-${pkgver}.tar.xz")
makedepends=("libncurses-dev" "groff" "autoconf" "make" "automake" "autopoint" "gcc" "gettext" "git" "pkg-config" "texinfo")
pkgdesc="Free replacement for the Pico text editor"
sha256sums=("86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526")
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
