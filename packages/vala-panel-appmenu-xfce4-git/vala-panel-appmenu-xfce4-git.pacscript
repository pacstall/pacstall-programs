pkgname='vala-panel-appmenu-xfce4-git'
gives='vala-panel-appmenu-xfce4'
pkgver='25.04'
pkgrel='3'
pkgdesc='Small utility to hold DBusMenu menus (XFCE4 plugin built-in)'
makedepends=(
  'meson'
  'valac'
  'valac-0.56-vapi>=0.56.18'
  'libglib2.0-dev'
  'libgirepository1.0-dev'
  'libxfce4panel-2.0-dev'
  'libxfce4ui-2-dev'
  'libwnck-3-dev'
  'libxfconf-0-dev'
  'libxfce4panel-2.0-dev>=4.19.0'
)
depends=(
  'libgtk-3-0'
  'libglib2.0-0'
  'libgirepository-1.0-1'
  'libxfce4panel-2.0-4'
  'libxfce4ui-2-0'
  'libwnck-3-0'
  'gir1.2-libxfce4panel-2.0'
  'gir1.2-libxfce4ui-2.0'
  'gir1.2-wnck-3.0'
  'gir1.2-libxfce4ui-2.0'
  'xfconf'
  'xfce4-panel>=4.19.0'
  'vala-panel-appmenu-common'
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
  meson build vala-panel-appmenu \
    -Dxfce=enabled \
    -Dappmenu-gtk-module=disabled \
    -Djayatana=disabled \
    --prefix=/usr \
    --libexecdir=lib \
    --force-fallback-for=appmenu-glib-translator
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --no-rebuild
  rm -rf "${pkgdir}/usr/share/locale"
  rm -rf "${pkgdir}/usr/share/glib-2.0/schemas/org.valapanel.appmenu.gschema.xml"
  rm -rf "${pkgdir}/usr/share/vala-panel/applets/org.valapanel.appmenu.plugin"
  rm -rf "${pkgdir}/usr/lib/${AARCH}-linux-gnu/vala-panel/applets/libappmenu.so"
}
