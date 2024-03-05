name="lightpad-git"
source=("https://github.com/libredeb/lightpad.git")
pkgver="0.0.8"
gives="com.github.libredeb.lightpad"
makedepends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "xterm" "python3" "python3-wheel" "python3-setuptools" "gnome-menus")
depends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "xterm" "python3" "python3-wheel" "gnome-menus")
pkgdesc="A lightweight, simple and powerful application launcher"
maintainer="Oren Klopfer <oren@taumoda.com>"

prepare() {
  sudo meson build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}

post_install() {
  sudo ln -sf "/usr/local/bin/com.github.libredeb.lightpad" "/usr/bin/lightpad"
}

post_remove() {
  sudo rm -f "/usr/bin/lightpad"
}
