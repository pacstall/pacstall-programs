name="dmenu"
pkgver="5.2"
source=("https://dl.suckless.org/tools/${name}-${pkgver}.tar.gz")
makedepends=("libxinerama-dev" "libxft-dev")
breaks=("${name}" "${name}_run" "${name}_path")
repology=("project: ${name}")
pkgdesc="A generic menu for X"
hash=("d4d4ca77b59140f272272db537e05bb91a5914f56802652dc57e61a773d43792")

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
