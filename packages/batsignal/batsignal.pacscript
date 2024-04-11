pkgname="batsignal"
repology=("project: ${pkgname}")
pkgver="1.6.4"
source=("https://github.com/electrickite/batsignal/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("pkg-config" "libnotify4" "libnotify-dev")
breaks=("${pkgname}" "${pkgname}-git")
pkgdesc="A lightweight battery monitor daemon"
sha256sums=("58439dac2b678ab798831fe861c06d2d5c128c4bb4bae1476a62ba1771da3983")
maintainer=("Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>")

build() {
  cd "${_archive}"
  sed -i '47d' Makefile
  sed -i '48d' Makefile
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
