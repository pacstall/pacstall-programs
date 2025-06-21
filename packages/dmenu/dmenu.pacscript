pkgname="dmenu"
arch=("any")
pkgver="5.3"
source=("@${pkgname}~${pkgver}::https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz")
makedepends=("libxinerama-dev" "libxft-dev")
breaks=("${pkgname}" "${pkgname}_run" "${pkgname}_path")
repology=("project: ${pkgname}")
pkgdesc="A generic menu for X"
sha256sums=("1a8f53e6fd2d749839ec870c5e27b3e14da5c3eeacbfcb945d159e1d5433795f")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
