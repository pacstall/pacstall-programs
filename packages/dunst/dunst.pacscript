pkgname="dunst"
pkgver="1.9.2"
source=("https://github.com/dunst-project/dunst/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("libdbus-1-dev" "libxinerama1" "libxrandr2" "libxss1" "libxss-dev" "libgtk-3-dev" "libnotify-dev")
pkgdesc="A highly configurable and lightweight notification daemon"
sha256sums=("fa6ce45c0af4bae188b0d679a5ba92f8f9b7e4301bb1bb476e82df26bce9e71a")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${pkgname}")

build() {
  cd "${_archive}"
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install -j"${NCPU}" DESTDIR="${pkgdir}"
}
