pkgname="moka-icon-theme"
arch=("any")
pkgver="5.4.0"
pkgrel="2"
maintainer=("aranym <aranym1@pm.me>")
source=("https://github.com/snwh/moka-icon-theme/archive/refs/tags/v5.4.0.tar.gz")
makedepends=("meson" "ninja-build")
pkgdesc="Moka is a stylized FreeDesktop icon set, created with simplicity in mind."
sha256sums=("b32e82aea4358e087620e852aa20042e791aa957a93de568da1d2223a46c7cd9")

build() {
  cd "${pkgname}-${pkgver}"
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  cd "${pkgname}-${pkgver}"
  ninja -C "build" install > /dev/null
}
