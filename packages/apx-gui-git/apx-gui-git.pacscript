pkgname="apx-gui-git"
gives="apx-gui"
source=("https://github.com/Vanilla-OS/apx-gui.git")
arch=("any")
pkgver="1.1.0"
depends=(
  "python3"
  "python3-gi"
  "gir1.2-gtk-4.0"
  "libadwaita-1-0"
  "gir1.2-vte-3.91"
  "python3-yaml"
  "python3-podman"
  "gettext"
)
makedepends=(
  "build-essential"
  "meson"
  "libadwaita-1-dev"
  "desktop-file-utils"
  "pkg-config"
  "libglib2.0-dev"
)
pacdeps=("distrobox" "apx-git")
breaks=("${gives}")
pkgdesc="Frontend in GTK 4 and Libadwaita for Apx"
maintainer=("Lobanokivan11 <lobanokivan11@gmail.com>")
external_connection=true

prepare() {
  cd "${gives}"
  meson setup build/ --buildtype=release --prefix=/usr
}

build() {
  cd "${gives}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" ninja -C build/ install
}
