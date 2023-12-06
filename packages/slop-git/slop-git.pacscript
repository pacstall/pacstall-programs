name="slop-git"
gives="slop"
pkgdesc="Queries for a selection from the user and prints the region to stdout"
url="https://github.com/naelstrof/slop.git"
pkgver="7.6"
makedepends=("cmake" "libglm-dev" "libxrender-dev" "libxfixes-dev" "libxcomposite-dev" "libxrandr-dev")
depends=("libglew-dev" "libxext-dev")
breaks=("${gives}-bin" "${gives}")
maintainer="Elsie19 <elsie19@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" ./
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
