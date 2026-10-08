pkgname="dunst"
arch=("any")
pkgver="1.13.2"
source=("@${pkgname}~${pkgver}::https://github.com/dunst-project/dunst/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "libxinerama1" "libxrandr2" "libxss1" "libxss-dev" "libgtk-3-dev" "libnotify-dev")
pkgdesc="A highly configurable and lightweight notification daemon"
sha256sums=("c68645cecef4a45840cd67c19a18a3a21ecae6b331e9864c2b745c31aee5fc85")
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
