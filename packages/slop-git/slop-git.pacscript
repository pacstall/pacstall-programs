name="slop-git"
pkgname="slop"
description="queries for a selection from the user and prints the region to stdout"
url="https://github.com/naelstrof/slop.git"
build_depends="cmake libglm-dev libxrender-dev libxfixes-dev libxcomposite-dev libxrandr-dev"
depends="libglew-dev libxext-dev"
breaks="${pkgname}-bin ${pkgname}"
maintainer="Henryws <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" ./
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}
