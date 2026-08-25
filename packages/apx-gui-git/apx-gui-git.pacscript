pkgname="apx-gui-git"
gives="apx-gui"
source=("https://github.com/Vanilla-OS/apx-gui.git")
arch=("any")
pkgver="1.1.0"
depends=(
  "libglib2.0-0"
  "libpango-1.0-0"
  "libpangocairo-1.0-0"
  "python3"
  "python3-gi"
  "libgdk-pixbuf-2.0-0"
  "libxkbcommon0"
  "gir1.2-gtk-4.0"
  "libadwaita-1-0"
  "python3-yaml"
  "python3-podman"
  "libcairo2"
  "libgdk-pixbuf-2.0-0"
  "libglib2.0-0>=2.72"
  "libpango-1.0-0>=1.50"
  "libpangocairo-1.0-0"
  "libstartup-notification0>=0.11"
  "libxcb-cursor0"
  "libxcb-ewmh2"
  "libxcb-icccm4"
  "libxcb-randr0"
  "libxcb-util1"
  "libxcb-xinerama0"
  "libxcb-xkb1"
  "libxcb1"
  "libxkbcommon-x11-0"
  "gettext"
)
makedepends=(
  "gcc"
  "meson"
  "ninja-build"
  "pkg-config"
  "build-essential"
  "bison"
  "libadwaita-1-dev"
  "libglib2.0-dev"
  "libpango1.0-dev"
  "libcairo2-dev"
  "libgdk-pixbuf-2.0-dev"
  "libxkbcommon-dev"
  "wayland-protocols"
  "libglib2.0-dev"
  "libpango1.0-dev"
  "libstartup-notification0-dev"
  "libxcb-cursor-dev"
  "desktop-file-utils"
  "libxcb-icccm4-dev"
  "libxcb-keysyms1-dev"
  "libxcb-randr0-dev"
  "libxcb-util-dev"
  "libxcb-xinerama0-dev"
  "libxcb-xkb-dev"
  "libxcb1-dev"
  "libglib2.0-dev"
  "pkg-config"
)
pacdeps=("distrobox" "apx-git")
breaks=("${gives}")
pkgdesc="Frontend in GTK 4 and Libadwaita for Apx"
maintainer=("Lobanokivan11 <lobanokivan11@gmail.com>")
external_connection=true
incompatible=('*:bullseye' '*:bookworm')

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
