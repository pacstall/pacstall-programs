pkgname="lagrange"
arch=("any")
pkgver="1.18.5"
license=("BSD-2-Clause")
source=("@${pkgname}~${pkgver}::https://git.skyjake.fi/gemini/lagrange/releases/download/v1.18.5/lagrange-1.18.5.tar.gz")
makedepends=("git" "cmake" "libsdl2-dev" "libssl-dev" "libpcre3-dev | libpcre2-dev" "zlib1g-dev" "libunistring-dev" "libmpg123-dev" "zip" "libharfbuzz-dev" "libfribidi-dev")
pkgdesc="A Beautiful Gemini Client"
sha256sums=("1dded64803eef8ff162e79025fd6db60f4a19bac5f9b804f46d79e07cbda5c65")

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
