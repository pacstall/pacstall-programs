pkgname="rhino-xfwm4-theme-git"
gives="rhino-xfwm4-theme"
makedepends=("sassc" "ninja-build" "meson")
maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgdesc="Rhino Linux XFWM4 theme"
source=("https://github.com/rhino-linux/${gives}.git")
arch=("all")
pkgver="0.0.1"

prepare() {
  cd "${gives}"
  meson setup build
  meson configure build -Dxfwm4=true
}

package() {
  cd "${gives}"
  # shellcheck disable=SC2069
  DESTDIR="${pkgdir}" ninja -C build install 2>&1 >> /dev/null
}
