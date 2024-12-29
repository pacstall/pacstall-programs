pkgname="batsignal"
repology=("project: ${pkgname}")
arch=("any")
pkgver="1.6.4"
source=("@${pkgname}~${pkgver}::https://github.com/electrickite/batsignal/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("pkg-config" "libnotify4" "libnotify-dev")
breaks=("${pkgname}" "${pkgname}-git")
pkgdesc="A lightweight battery monitor daemon"
sha256sums=("58439dac2b678ab798831fe861c06d2d5c128c4bb4bae1476a62ba1771da3983")
maintainer=("Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>")

build() {
  cd "${pkgname}~${pkgver}"
  sed -i '47d' Makefile
  sed -i '48d' Makefile
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
