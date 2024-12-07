pkgname="st-distrotube-git"
maintainer=("edward-riley <edward@edwardriley.co.uk>")
source=("https://gitlab.com/dwt1/st-distrotube.git")
arch=("any")
pkgver="0.0.1"
makedepends=("make" "libharfbuzz-bin" "libxft-dev" "libpango1.0-dev")
depends=("fontconfig")
gives="st"
pkgdesc="Distrotube's st build"
breaks="st"

build() {
  cd "st-distrotube"
  make -j"${NCPU}"
}

package() {
  cd "st-distrotube"
  make install DESTDIR="${pkgdir}"
}
