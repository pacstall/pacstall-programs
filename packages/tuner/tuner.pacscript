pkgname="tuner"
pkgver="1.3.1"
license="GPL-3.0"
source=("https://github.com/louis77/tuner/archive/refs/tags/1.3.1.zip")
makedepends=("meson" "valac" "libgtk-3-dev" "libgranite-dev" "libsoup2.4-dev" "libgstreamer1.0-dev" "libgstreamer-plugins-bad1.0-dev" "libjson-glib-dev" "libgee-0.8-dev" "libgeocode-glib-dev" "libgeoclue-2-dev" "libgeocode-glib0")
depends=("desktop-file-utils")
replaces=("tuner-git")
pkgdesc="Discover and listen to internet radio stations."
sha256sums=("4b8cc5941652ebb872793bbc0f3d56e1c5d4423e6cf8d16aaeea25999075c1aa")

prepare() {
  cd "${_archive}"
  meson builddir --prefix=/usr
}

build() {
  cd "${_archive}"
  ninja -C builddir -j"${NCPU}"
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -C builddir install
}

post_install() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas
  sudo update-desktop-database -q /usr/share/applications
  sudo gtk-update-icon-cache -qtf /usr/share/icons/hicolor
}

post_remove() {
  sudo update-desktop-database -q /usr/share/applications
}
