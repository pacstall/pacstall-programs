pkgname="ptyxis"
pkgver="48.4"
pkgdesc='A terminal for a container-oriented desktop'
arch=('any')
url='https://gitlab.gnome.org/chergert/ptyxis'
license=('GPL-3.0-or-later')
depends=('dconf-gsettings-backend' 'libgcc-s1' 'libglib2.0-0' 'libc6'
  'libgtk-4-1' 'hicolor-icon-theme' 'libjson-glib-1.0-0' 'libadwaita-1-0'
  'libportal1' 'libportal-gtk4-1' 'libpango-1.0-0' 'libvte-2.91-0' 'libvte-2.91-gtk4-0')
makedepends=('meson' 'cmake' 'libglib2.0-dev>=2.80' 'libjson-glib-dev' 'libgtk-4-dev' 'libadwaita-1-dev>=1.6'
  'libvte-2.91-dev' 'libvte-2.91-gtk4-dev' 'libportal-gtk4-dev' 'appstream')
source=("${pkgname}::git+${url}#tag=${pkgver}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  meson "${pkgname}" build --buildtype=release
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

post_install() {
  sudo "/usr/bin/glib-compile-schemas" "/usr/local/share/glib-2.0/schemas"
  gtk-update-icon-cache
}
