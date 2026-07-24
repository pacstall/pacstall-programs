# Script based by Echo J. <aidas957 at gmail dot com> & Princeton Ferro (prince781) <princetonferro[at]gmail[dot]com>

pkgname="cambalache-git"
pkgver="1.0.r18.g3a9d1f5"
gives="cambalache"
pkgdesc="New RAD tool for Gtk 4 and 3 (Git version)"
url="https://gitlab.gnome.org/jpu/cambalache"
arch=("amd64")
conflicts=("${gives}")
provides=("${gives}")
source=("https://gitlab.gnome.org/jpu/cambalache.git")
license=('LGPL-2.1-only')
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true
depends=(
  'libatk-adaptor' 'libatk1.0-0' 'libcairo2' 'dconf-gsettings-backend'
  'libgdk-pixbuf-2.0-0' 'libglib2.0-0' 'libgraphene-1.0-0' 'libgtk-3-0'
  'libgtk-4-1' 'libgtksourceview-5-0' 'libharfbuzz0b' 'hicolor-icon-theme'
  'libadwaita-1-0' 'libhandy-1-0' 'libxkbcommon0' 'libpango-1.0-0'
  'libpixman-1-0' 'python3' 'python3-gi' 'python3-lxml' 'libwayland-client0'
  'libwebkit2gtk-4.1-0' 'libwebkitgtk-6.0-4'
)
makedepends=(
  'git' 'libgirepository1.0-dev' 'libgtk-4-dev'
  'meson' 'ninja-build' 'wayland-protocols' 'libxml2-dev'
  'python3-gi' 'libadwaita-1-dev' 'libgtksourceview-5-dev'
  'libgtk-3-dev' 'libhandy-1-dev' 'libwebkitgtk-6.0-dev' 'python3-lxml'
  'libwebkit2gtk-4.1-dev' 'libwlroots-dev | libwlroots-0.18-dev | libwlroots-0.19-dev | libwlroots-0.20-dev'
)

prepare() {
  # Use project's Casilda dependency
  meson subprojects download casilda --sourcedir="${gives}"
  meson subprojects update casilda --sourcedir="${gives}"
}

build() {
  cd "${gives}" && mkdir _build

  # Configure project and build it
  sed -i "s/pygobject_dep = dependency('pygobject-3.0', version: '>= 3.52.0')/ /g" meson.build
  meson setup --wipe --prefix=~/.local _build .
  meson compile -C _build -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" ninja install -C _build/ install
}
