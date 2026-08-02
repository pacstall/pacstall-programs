maintainer=("IMY <omranmansour096@gmail.com>")
pkgname='singularity-desktop-git'
pkgver=0.1.0
pkgdesc='The Singularity Desktop Environment'
url='https://sinty.dev/'
license=('GPL-3.0')
arch=('amd64')

source=("https://github.com/singularityos-lab/singularity-desktop")

makedepends=(
  'meson'
  'ninja-build'
  'valac'
  'pkg-config'
  'libgtk-4-dev'
  'libgtk4-layer-shell-dev'
  'libdecor-0-dev'
  'wayland-protocols'
  'libwayland-dev'
  'libnm-dev'
  'libupower-glib-dev'
  'libpulse-dev'
  'libgoa-1.0-dev'
  'libpolkit-gobject-1-dev'
  'libgnome-desktop-4-dev'
  'libsoup-3.0-dev'
  'libjson-glib-dev'
  'libpeas-2-dev'
  'libvte-2.91-gtk4-dev'
  'libgtksourceview-5-dev'
  'libpoppler-glib-dev'
  'libdbusmenu-glib-dev'
  'libatspi2.0-dev'
  'libtracker-sparql-3.0-dev'
  'libgudev-1.0-dev'
  'libpam0g-dev'
  'libdrm-dev'
  'libseat-dev'
  'libdisplay-info-dev'
  'libliftoff-dev'
  'hwdata'
  'libgbm-dev'
)

depends=(
  'gtk4-layer-shell'
  'libdecor-0-plugin-1-gtk'
  'qt6-xdgdesktopportal-platformtheme'
  'appmenu-gtk3-module'
  'xdg-desktop-portal'
)

build() {
  cd "${srcdir}/${pkgname}"
  meson setup build \
    --prefix=/usr \
    -Dbuildtype=release

  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" meson install -C build
}

postinst() {
  glib-compile-schemas /usr/share/glib-2.0/schemas &> /dev/null || true
  update-desktop-database -q /usr/share/applications &> /dev/null || true
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor &> /dev/null || true
}

postrm() {
  glib-compile-schemas /usr/share/glib-2.0/schemas &> /dev/null || true
  update-desktop-database -q /usr/share/applications &> /dev/null || true
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor &> /dev/null || true
}
