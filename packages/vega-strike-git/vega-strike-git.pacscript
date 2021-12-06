name="vega-strike-git"
url="https://github.com/vegastrike/Assets-Production.git"
depends="make"
description="Space Flight Simulator and trading game"
pacdeps="vega-strike-engine-git"
maintainer="echometerain <echometer@disroot.org>"

pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
  true
}
build() {
  cmake "./CMakeLists.txt"
  make
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}
