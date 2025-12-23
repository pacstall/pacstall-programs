pkgname="dunst"
arch=("any")
pkgver="1.13.0"
source=("@${pkgname}~${pkgver}::https://github.com/dunst-project/dunst/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "libxinerama1" "libxrandr2" "libxss1" "libxss-dev" "libgtk-3-dev" "libnotify-dev")
pkgdesc="A highly configurable and lightweight notification daemon"
sha256sums=("7a8a1813977ad5941488c66b914501703fc0f6e12e631dc18506ad617242e7a0")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${pkgname}")

build() {
  cd "${pkgname}~${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install -j"${NCPU}" DESTDIR="${pkgdir}"
}
