name="vega-strike-git"
source=("https://github.com/vegastrike/Assets-Production.git")
pkgver="0.8.0"
makedepends=("make")
pkgdesc="Space Flight Simulator and trading game"
pacdeps="vega-strike-engine-git"
maintainer="echometerain <echometer@disroot.org>"

build() {
  cmake "./CMakeLists.txt"
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
