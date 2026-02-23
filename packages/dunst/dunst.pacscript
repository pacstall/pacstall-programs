pkgname="dunst"
arch=("any")
pkgver="1.13.1"
source=("@${pkgname}~${pkgver}::https://github.com/dunst-project/dunst/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "libxinerama1" "libxrandr2" "libxss1" "libxss-dev" "libgtk-3-dev" "libnotify-dev")
pkgdesc="A highly configurable and lightweight notification daemon"
sha256sums=("a578e5c2cdb546187355c710f1aa84c472e6e23828e692fe1cb0ebb9635b11a6")
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
