name="suru-icon-theme-git"
gives="suru-icon-theme"
version="0.1"
maintainer="aranym <aranym1@pm.me>"
url="https://github.com/snwh/${name}.git"
makedepends=("meson" "ninja-build")
description="Revitalization of the Suru icon set designed for Ubuntu Touch"

build() {
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  sudo ninja -C "build" install > /dev/null
}
