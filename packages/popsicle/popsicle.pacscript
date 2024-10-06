pkgname="popsicle"
gives="popsicle"
pkgver="1.3.3"
source=("https://github.com/pop-os/popsicle/archive/refs/tags/1.3.3.zip")
license="MIT"
makedepends=("cargo" "libgtk-3-dev" "help2man")
pkgdesc="Multiple USB File Flasher"
external_connection=true
maintainer=("James Ed Randson <jimedrand@disroot.org>")
sha256sums=("01d67266af21505d44c4f646d06946bfa4d53e60aa7f993f7bccb852ec09451e")

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
