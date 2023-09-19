name="tuner-git"
license="GPL-3.0"
url="https://codeberg.org/tuner/tuner.git"
pkgver="1.5.1"
makedepends=("meson" "valac" "libgtk-3-dev" "libgranite-dev" "libsoup2.4-dev" "libgstreamer1.0-dev" "libgstreamer-plugins-bad1.0-dev" "libjson-glib-dev" "libgee-0.8-dev" "libgeocode-glib-dev" "libgeoclue-2-dev" "libgeocode-glib-dev")
depends=("desktop-file-utils")
replace=("tuner")
pkgdesc="Tuner Radio Player - development version"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

prepare() {
  meson builddir --prefix=/usr
}

build() {
  ninja -C builddir -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C builddir install
}

post_install() {
  sudo glib-compile-schemas /usr/share/glib-2.0/schemas
  sudo update-desktop-database -q /usr/share/applications
  sudo gtk-update-icon-cache -qtf /usr/share/icons/hicolor
}

post_remove() {
  sudo update-desktop-database -q /usr/share/applications
}
