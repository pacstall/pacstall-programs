name="vega-strike-git"
url="https://github.com/vegastrike/Assets-Production.git"
build_depends=("make")
description="Space Flight Simulator and trading game"
pacdeps="vega-strike-engine-git"
maintainer="echometerain <echometer@disroot.org>"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  cmake "./CMakeLists.txt"
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
