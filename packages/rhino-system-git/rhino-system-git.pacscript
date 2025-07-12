pkgname="rhino-system-git"
source=("https://github.com/rhino-linux/rhino-system.git")
arch=("any")
pkgver="0.0.1"
pkgrel="2"
makedepends=("python3-gi" "gir1.2-adw-1" "gir1.2-gtk-4.0" "gir1.2-vte-3.91" "libadwaita-1-0" "libvte-2.91-gtk4-0" "gettext" "desktop-file-utils" "libglib2.0-dev" "cmake" "meson" "ninja-build")
depends=("python3-gi" "gir1.2-adw-1" "gir1.2-gtk-4.0" "gir1.2-vte-3.91" "libadwaita-1-0" "libvte-2.91-gtk4-0" "gettext" "desktop-file-utils" "libglib2.0-dev" "mesa-utils" "util-linux" "pciutils")
pacdeps=("rhino-pkg-git")
gives="rhino-system"
pkgdesc="System info and upgrade utility by the Rhino Linux team"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("ubuntu:20.04" "ubuntu:20.10" "ubuntu:21.04" "ubuntu:21.10" "ubuntu:22.04" "debian:*")

build() {
  cd "rhino-system"
  meson setup build
}

package() {
  cd "rhino-system"
  DESTDIR="${pkgdir}" ninja -C build install
  chmod +x "${pkgdir}/usr/local/bin/rhinosystem"
}
