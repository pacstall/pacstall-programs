pkgname="slop-git"
gives="slop"
pkgdesc="Queries for a selection from the user and prints the region to stdout"
source=("https://github.com/naelstrof/slop.git")
pkgver="7.6"
makedepends=("cmake" "libglm-dev" "libxrender-dev" "libxfixes-dev" "libxcomposite-dev" "libxrandr-dev")
depends=("libglew-dev" "libxext-dev")
breaks=("${gives}-bin" "${gives}")
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${_archive}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" ./
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
