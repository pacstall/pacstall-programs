pkgname="dunst"
arch=("any")
pkgver="1.12.2"
source=("@${pkgname}~${pkgver}::https://github.com/dunst-project/dunst/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "libxinerama1" "libxrandr2" "libxss1" "libxss-dev" "libgtk-3-dev" "libnotify-dev")
pkgdesc="A highly configurable and lightweight notification daemon"
sha256sums=("8f7664bd4e6083e9604e282145fe5b8dee7655fa0b099a5b682a2549e1f33d32")
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
