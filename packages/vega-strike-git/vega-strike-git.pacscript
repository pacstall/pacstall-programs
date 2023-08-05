name="vega-strike-git"
url="https://github.com/vegastrike/Assets-Production.git"
pkgver="0.8.0"
makedepends=("make")
pkgdesc="Space Flight Simulator and trading game"
pacdeps="vega-strike-engine-git"
maintainer="echometerain <echometer@disroot.org>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  cmake "./CMakeLists.txt"
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
