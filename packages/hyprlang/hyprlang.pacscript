pkgname="hyprlang"
pkgver="0.5.0"
pkgdesc="implementation library for the hypr config language"
arch=("amd64" "arm64")
url="https://github.com/hyprwm/${pkgname}"
depends=("build-essential")
makedepends=("cmake")
source=("@${pkgname}~${pkgver}::${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("c59e705f2c2ff9ea4e2b183fdf0bc20a62b7162604a657d6352716a1fd5061b2")
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${pkgname}~${pkgver}"
  cmake -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release
  cmake --build build -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
