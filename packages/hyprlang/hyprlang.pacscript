name="hyprlang"
pkgver="0.5.0"
pkgdesc="implementation library for the hypr config language"
arch=("amd64" "arm64")
homepage="https://github.com/hyprwm/${name}"
depends=("build-essential")
makedepends=("cmake")
url="${homepage}/archive/v${pkgver}/${name}-${pkgver}.tar.gz"
hash="c59e705f2c2ff9ea4e2b183fdf0bc20a62b7162604a657d6352716a1fd5061b2"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
  cmake -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_BUILD_TYPE=Release
  cmake --build build -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" cmake --install build
  sudo install -Dm0644 -t "${pkgdir}/usr/share/licenses/${name}" LICENSE
}
