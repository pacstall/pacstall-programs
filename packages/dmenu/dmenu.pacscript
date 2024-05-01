pkgname="dmenu"
pkgver="5.2"
source=("https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz")
makedepends=("libxinerama-dev" "libxft-dev")
breaks=("${pkgname}" "${pkgname}_run" "${pkgname}_path")
repology=("project: ${pkgname}")
pkgdesc="A generic menu for X"
sha256sums=("d4d4ca77b59140f272272db537e05bb91a5914f56802652dc57e61a773d43792")

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
