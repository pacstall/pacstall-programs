pkgname='vala-panel-appmenu-xfce4-git'
gives='vala-panel-appmenu-xfce4'
pkgver='24.05'
pkgdesc='Small utility to hold DBusMenu menus (XFCE4 plugin built-in)'
makedepends=(
  'meson'
  'cmake'
  'valac'
  'libglib2.0-dev'
  'libgirepository1.0-dev'
  'libxfce4panel-2.0-dev'
  'libxfce4ui-2-dev'
  'libwnck-3-dev'
  'libxfconf-0-dev'
  'libxfce4panel-2.0-dev>=4.20'
)
depends=(
  'libglib2.0-0'
  'libgirepository-1.0-1'
  'libxfce4panel-2.0-4'
  'gir1.2-libxfce4panel-2.0'
  'libxfce4ui-2-0'
  'gir1.2-libxfce4ui-2.0'
  'libwnck-3-0'
  'gir1.2-wnck-3.0'
  'gir1.2-libxfce4ui-2.0'
  'xfconf'
  'xfce4-panel'
)
arch=('amd64' 'arm64')
license=('LGPL-3.0-or-later')
url='https://gitlab.com/vala-panel-project/vala-panel-appmenu'
source=("${url}.git")
provides=(
  "xfce4-appmenu-plugin=${pkgver}"
  "appmenu-registrar=${pkgver}"
  "appmenu-glib-translator=${pkgver}"
)
replaces=(
  'xfce4-appmenu-plugin'
  'appmenu-registrar'
  'appmenu-glib-translator'
)
maintainer=('Oren Klopfer <oren@taumoda.com>')
build() {
  meson build vala-panel-appmenu -Dxfce=enabled --prefix=/usr --libexecdir=lib
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --no-rebuild
  rm -rf "${pkgdir}"/usr/share/locale
}
