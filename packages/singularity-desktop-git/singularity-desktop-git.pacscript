maintainer=("IMY <omranmansour096@gmail.com>")
pkgname='singularity-desktop-git'
gives='singularity-desktop'
pkgver="0.1.0"
pkgdesc='The Singularity Desktop Environment'
url='https://sinty.dev/'
license=('GPL-3.0')
arch=('amd64')
source=("https://github.com/singularityos-lab/${gives}.git")
makedepends=(
  'build-essential'
  'cmake'
  'meson>=1.10.0'
  'ninja-build'
  'valac'
  'git'
  'gettext'
  'pkg-config'
  'scdoc'
  'golang-go'
  'libgtk-4-dev'
  'libglib2.0-dev'
  'libgtk4-layer-shell-dev'
  'libdecor-0-dev'
  'wayland-protocols'
  'libwayland-dev'
  'libnm-dev'
  'libupower-glib-dev'
  'libpulse-dev'
  'libgoa-1.0-dev'
  'libgoa-backend-1.0-dev'
  'libpolkit-agent-1-dev'
  'libpolkit-gobject-1-dev'
  'libgnome-desktop-4-dev'
  'libsoup-3.0-dev'
  'libjson-glib-dev'
  'libpeas-2-dev'
  'libvte-2.91-gtk4-dev'
  'libgtksourceview-5-dev'
  'libgstreamer1.0-dev'
  'libgstreamer-plugins-base1.0-dev'
  'libpipewire-0.3-dev'
  'libsecret-1-dev'
  'librsvg2-dev'
  'libpoppler-glib-dev'
  'libwebkitgtk-6.0-dev'
  'libxml2-dev'
  'libpango1.0-dev'
  'libcairo2-dev'
  'libpixman-1-dev'
  'libinput-dev'
  'libxkbcommon-dev'
  'libxcb1-dev'
  'libxcb-ewmh-dev'
  'libxcb-icccm4-dev'
  'libxcb-composite0-dev'
  'libxcb-res0-dev'
  'libdbusmenu-glib-dev'
  'libatspi2.0-dev'
  'libtracker-sparql-3.0-dev'
  'libgudev-1.0-dev'
  'libudev-dev'
  'libsystemd-dev'
  'libpng-dev'
  'libsodium-dev'
  'libgcrypt20-dev'
  'libpam0g-dev'
  'libdrm-dev'
  'libseat-dev'
  'libdisplay-info-dev'
  'libliftoff-dev'
  'hwdata'
  'xwayland'
  'sassc'
  'libgbm-dev'
  'libgee-0.8-dev'
  'gobject-introspection'
  'libcrypt-dev'
)
pacdeps=('vetro-git')
depends=(
  'libgtk4-layer-shell0'
  'libdecor-0-plugin-1-gtk'
  'qt6-xdgdesktopportal-platformtheme'
  'appmenu-gtk3-module'
  'xdg-desktop-portal'
)

prepare() {
  cd "${gives}"
  meson setup build
}

build() {
  cd "${gives}"
  meson compile -C build -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" meson install -C build
}

post_install() {
  glib-compile-schemas /usr/share/glib-2.0/schemas
  update-desktop-database -q /usr/share/applications
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}

post_remove() {
  glib-compile-schemas /usr/share/glib-2.0/schemas
  update-desktop-database -q /usr/share/applications
  gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor
}
