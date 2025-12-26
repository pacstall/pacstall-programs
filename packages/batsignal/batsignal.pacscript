pkgname="batsignal"
repology=("project: ${pkgname}")
arch=("any")
pkgver="1.8.0"
source=("https://github.com/electrickite/batsignal/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("pkg-config" "libnotify4" "libnotify-dev")
breaks=("${pkgname}" "${pkgname}-git")
pkgdesc="A lightweight battery monitor daemon"
sha256sums=("c8c2a048f4aa105aae389d9d765b76057d4998dbfc29a7dfeaf66351eaa7cba1")
maintainer=("Harshwardhan Mehrotra <harshwardhanmehrotra@gmail.com>")

build() {
  cd "${pkgname}-${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}
