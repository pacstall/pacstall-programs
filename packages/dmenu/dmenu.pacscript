pkgname="dmenu"
arch=("any")
pkgver="5.4"
source=("@${pkgname}~${pkgver}::https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz")
makedepends=("libxinerama-dev" "libxft-dev")
breaks=("${pkgname}" "${pkgname}_run" "${pkgname}_path")
repology=("project: ${pkgname}")
pkgdesc="A generic menu for X"
sha256sums=("8fbace2a0847aa80fe861066b118252dcc7b4ca0a0a8f3a93af02da8fb6cd453")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
