name="hyprlang"
pkgver="0.4.2"
pkgdesc="implementation library for the hypr config language"
arch=("amd64" "arm64")
homepage="https://github.com/hyprwm/${name}"
depends=("build-essential")
makedepends=("cmake")
url="${homepage}/archive/v${pkgver}/${name}-${pkgver}.tar.gz"
hash="a365ee660f4456e7d4d21f0153563c00146f2c9fb9f1e7b5a6ab12fce924f6f8"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
  cmake -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  sudo DESTDIR="${pkgdir}" cmake --install build
  sudo install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
