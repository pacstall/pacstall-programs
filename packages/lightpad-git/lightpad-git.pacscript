name="lightpad-git"
url="https://github.com/libredeb/lightpad.git"
pkgver="0.0.8"
gives="com.github.libredeb.lightpad"
makedepends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "xterm" "python3" "python3-wheel" "python3-setuptools" "gnome-menus")
depends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "xterm" "python3" "python3-wheel" "gnome-menus")
pkgdesc="A lightweight, simple and powerful application launcher"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  sudo meson build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo ln -sf "/usr/local/bin/com.github.libredeb.lightpad" "${pkgdir}/usr/bin/lightpad"
}
