pkgname="lightpad-git"
source=("https://github.com/libredeb/lightpad.git")
arch=("any")
pkgver="0.0.8"
pkgrel="2"
gives="com.github.libredeb.lightpad"
makedepends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "python3" "python3-wheel" "python3-setuptools" "gnome-menus")
depends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "python3" "python3-wheel" "gnome-menus")
pkgdesc="A lightweight, simple and powerful application launcher"
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "lightpad"
  meson build
}

package() {
  cd "lightpad"
  DESTDIR="${pkgdir}" ninja -C build install
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/local/bin/com.github.libredeb.lightpad" "${pkgdir}/usr/bin/lightpad"
}
