name="rhino-system-git"
url="https://github.com/rhino-linux/rhino-system.git"
build_depends=("python3-gi" "gir1.2-adw-1" "gir1.2-gtk-4.0" "gir1.2-vte-3.91" "libadwaita-1-0" "libvte-2.91-gtk4-0" "py-cpuinfo" "gettext" "desktop-file-utils" "libglib2.0-dev" "cmake" "meson" "ninja-build")
depends=("python3-gi" "gir1.2-adw-1" "gir1.2-gtk-4.0" "gir1.2-vte-3.91" "libadwaita-1-0" "libvte-2.91-gtk4-0" "py-cpuinfo" "gettext" "desktop-file-utils" "libglib2.0-dev")
pacdeps=("rhino-pkg-git")
gives="rhino-system"
description="System info and upgrade utility by the Rhino Linux team"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  sudo meson setup build
}

install() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
  sudo chmod +x "${pkgdir}/usr/local/bin/rhinosystem"
}
