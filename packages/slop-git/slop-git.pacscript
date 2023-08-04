name="slop-git"
pkgname="slop"
description="Queries for a selection from the user and prints the region to stdout"
url="https://github.com/naelstrof/slop.git"
makedepends=("cmake" "libglm-dev" "libxrender-dev" "libxfixes-dev" "libxcomposite-dev" "libxrandr-dev")
depends=("libglew-dev" "libxext-dev")
breaks=("${pkgname}-bin" "${pkgname}")
maintainer="Elsie19 <hwengerstickel@pm.me>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" ./
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
