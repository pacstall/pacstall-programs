name="lightpad-git"
url="https://github.com/libredeb/lightpad.git"
gives="com.github.libredeb.lightpad"
build_depends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "xterm" "python3" "python3-wheel" "python3-setuptools" "gnome-menus")
depends=("meson" "ninja-build" "libgee-0.8-dev" "libgnome-menu-3-dev" "cdbs" "valac" "libvala-0.56-dev" "libvaladoc-0.56-dev" "libvalapanel-dev" "libglib2.0-dev" "libwnck-3-dev" "libgtk-3-dev" "xterm" "python3" "python3-wheel" "python3-setuptools" "gnome-menus")
description="A lightweight, simple and powerful application launcher"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  echo "0.0.10"
}
version="$(pkgver)"

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
