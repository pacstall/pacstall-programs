pkgname="gnome-tweaks"
gives="gnome-tweaks"
pkgver="40.10"
license="GPL-3.0"
source=("https://github.com/GNOME/gnome-tweaks/archive/refs/tags/${pkgver}.zip")
makedepends=("meson" "python3-distutils")
depends=("gettext" "gsettings-desktop-schemas" "python3" "gnome-settings-daemon" "gnome-shell-common" "mutter-common" "python3-gi" "gir1.2-gtk-3.0" "gir1.2-gnomedesktop-3.0" "libhandy-1-0" "gir1.2-soup-2.4" "gir1.2-notify-0.7" "gir1.2-glib-2.0" "gir1.2-pango-1.0" "gnome-shell-extension-prefs")
breaks=("${gives}" "${gives}-bin" "${gives}-git")
pkgdesc="Graphical interface for advanced GNOME 3 settings"
sha256sums=("59d9597840335b0d71afd287bec09260e172ff89e14d6d12c3416f23557974ee")
repology=("project: gnome-tweaks")

prepare() {
  cd "${_archive}"
  meson builddir
}

build() {
  cd "${_archive}"
  ninja -C builddir
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -C builddir install -j"${NCPU}"
}
