pkgname="lagrange"
arch=("any")
pkgver="1.19.4"
license=("BSD-2-Clause")
source=("@${pkgname}~${pkgver}::https://git.skyjake.fi/gemini/lagrange/releases/download/v1.19.4/lagrange-1.19.4.tar.gz")
makedepends=("git" "cmake" "libsdl2-dev" "libssl-dev" "libpcre3-dev | libpcre2-dev" "zlib1g-dev" "libunistring-dev" "libmpg123-dev" "zip" "libharfbuzz-dev" "libfribidi-dev")
pkgdesc="A Beautiful Gemini Client"
sha256sums=("a51e7519f0dfa2cfc2918d6b498a6aca6a966702ae0f8d2c94f02f4287b2ffd7")

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
