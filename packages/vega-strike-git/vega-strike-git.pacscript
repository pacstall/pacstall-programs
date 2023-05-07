name="vega-strike-git"
url="https://github.com/vegastrike/Assets-Production.git"
build_depends=("make")
description="Space Flight Simulator and trading game"
pacdeps="vega-strike-engine-git"
maintainer="echometerain <echometer@disroot.org>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  cmake "./CMakeLists.txt"
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
