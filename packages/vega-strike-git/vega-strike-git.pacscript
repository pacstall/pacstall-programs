pkgname="vega-strike-git"
source=("https://github.com/vegastrike/Assets-Production.git")
arch=("any")
pkgver="0.8.0"
makedepends=("make")
pkgdesc="Space Flight Simulator and trading game"
pacdeps="vega-strike-engine-git"
maintainer=("echometerain <echometer@disroot.org>")

build() {
  cd "Assets-Production"
  cmake "./CMakeLists.txt"
  make -j"${NCPU}"
}

package() {
  cd "Assets-Production"
  make install DESTDIR="${pkgdir}"
}
