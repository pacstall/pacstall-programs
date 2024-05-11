pkgname="moka-icon-theme"
pkgver="5.4.0"
maintainer=("aranym <aranym1@pm.me>")
source=("https://codeload.github.com/snwh/moka-icon-theme/tar.gz/refs/tags/v5.4.0")
makedepends=("meson" "ninja-build")
pkgdesc="Moka is a stylized FreeDesktop icon set, created with simplicity in mind."
sha256sums=("b32e82aea4358e087620e852aa20042e791aa957a93de568da1d2223a46c7cd9")

build() {
  cd "${_archive}"
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  cd "${_archive}"
  ninja -C "build" install > /dev/null
}
