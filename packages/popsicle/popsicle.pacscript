pkgname="popsicle"
gives="popsicle"
arch=("any")
pkgver="1.3.3"
source=("@${pkgname}~${pkgver}::https://github.com/pop-os/popsicle/archive/refs/tags/1.3.3.zip")
license="MIT"
makedepends=("cargo" "libgtk-3-dev" "help2man")
pkgdesc="Multiple USB File Flasher"
external_connection=true
maintainer=("James Ed Randson <jimedrand@disroot.org>")
sha256sums=("01d67266af21505d44c4f646d06946bfa4d53e60aa7f993f7bccb852ec09451e")
compatible=("debian:trixie")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
