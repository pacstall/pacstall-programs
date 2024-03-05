name="st-distrotube-git"
maintainer="edward-riley <edward@edwardriley.co.uk>"
source=("https://gitlab.com/dwt1/st-distrotube.git")
pkgver="0.0.1"
makedepends=("make" "libharfbuzz-bin" "libxft-dev" "libpango1.0-dev")
depends=("fontconfig")
gives="st"
pkgdesc="Distrotube's st build"
breaks="st"

build() {
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
