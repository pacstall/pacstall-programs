_pkg="lightpad"
pkgname="${_pkg}-git"
source=("https://github.com/libredeb/${_pkg}.git")
arch=("any")
pkgver="0.1.0"
gives="io.github.libredeb.${_pkg}"
provides=("${_pkg}" "com.github.libredeb.${_pkg}" "io.github.libredeb.${_pkg}")
replaces=("${provides[@]}")
makedepends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "python3" "python3-wheel" "python3-setuptools" "gnome-menus")
depends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "python3" "python3-wheel" "gnome-menus")
pkgdesc="A lightweight, simple and powerful application launcher"
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${_pkg}"
  meson build
}

package() {
  cd "${_pkg}"
  DESTDIR="${pkgdir}" ninja -C build install
  mkdir -p "${pkgdir}/usr/local/bin"
  ln -sf "/usr/local/bin/${gives}" "${pkgdir}/usr/local/bin/${_pkg}"
}
