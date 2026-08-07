pkgname="hyprlang"
pkgver="0.6.8"
pkgdesc="implementation library for the hypr config language"
arch=("amd64" "arm64")
url="https://github.com/hyprwm/${pkgname}"
depends=("build-essential")
makedepends=("cmake")
source=("@${pkgname}~${pkgver}::${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("d10a0778b646e04d83e8b90cc0f764fb96958c01a15c3c0678d95a40fc647ed5")
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
