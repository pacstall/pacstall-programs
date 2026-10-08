pkgname="lagrange"
arch=("any")
pkgver="1.20.8"
license=("BSD-2-Clause")
source=("@${pkgname}~${pkgver}::https://git.skyjake.fi/gemini/lagrange/releases/download/v1.20.8/lagrange-1.20.8.tar.gz")
makedepends=("git" "cmake" "libsdl2-dev" "libssl-dev" "libpcre3-dev | libpcre2-dev" "zlib1g-dev" "libunistring-dev" "libmpg123-dev" "zip" "libharfbuzz-dev" "libfribidi-dev")
pkgdesc="Beautiful Gemini Client"
repology=("project: ${pkgname}")
sha256sums=("eff268bf2f9e1b68b59d37172c06226e61868dcde792bdfc44e90987dc46c6c1")

prepare() {
  cd "${pkgname}~${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}~${pkgver}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr" -DENABLE_123=ON
}

package() {
  cd "${pkgname}~${pkgver}"
  cmake --build . --target install -- -j"${NCPU}" DESTDIR="${pkgdir}"
}
