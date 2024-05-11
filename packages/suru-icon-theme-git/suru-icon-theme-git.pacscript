pkgname="suru-icon-theme-git"
gives="suru-icon-theme"
pkgver="0.0.1"
maintainer=("aranym <aranym1@pm.me>")
source=("https://github.com/snwh/suru-icon-theme.git")
makedepends=("meson" "ninja-build")
pkgdesc="Revitalization of the Suru icon set designed for Ubuntu Touch"

build() {
  cd "${_archive}"
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  cd "${_archive}"
  ninja -C "build" install > /dev/null
}
