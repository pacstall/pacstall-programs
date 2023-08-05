name="suru-icon-theme-git"
gives="suru-icon-theme"
pkgver="0.0.1"
maintainer="aranym <aranym1@pm.me>"
url="https://github.com/snwh/suru-icon-theme.git"
makedepends=("meson" "ninja-build")
pkgdesc="Revitalization of the Suru icon set designed for Ubuntu Touch"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  sudo ninja -C "build" install > /dev/null
}
