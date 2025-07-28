pkgname='libxkbcommon'
arch=('any')
pkgver='1.10.0'
pkgdesc='Keyboard keymap compiler and support library'
makedepends=(
  'bash-completion'
  'doxygen'
  'bison'
  'pkg-config'
  'libc6-dev'
  'graphviz'
  'libxcb1-dev'
  'libxml2-dev'
  'meson'
  'libwayland-dev'
  'wayland-protocols'
  'xkb-data'
  'x11proto-dev'
  'libxcb-xkb-dev'
)
depends=(
  'libxml2'
  'xkb-data'
  'libxcb-xkb-dev'
)
replaces=(
  'libxkbcommon-tools'
  'libxkbcommon-x11-0'
  'libxkbcommon-x11-dev'
  'libxkbcommon0'
  'libxkbcommon-dev'
  'libxkbregistry0'
  'libxkbregistry-dev'
)
provides=(
  "libxkbcommon-tools=${pkgver}"
  "libxkbcommon-x11-0=${pkgver}"
  "libxkbcommon-x11-dev=${pkgver}"
  "libxkbcommon0=${pkgver}"
  "libxkbcommon-dev=${pkgver}"
  "libxkbregistry0=${pkgver}"
  "libxkbregistry-dev=${pkgver}"
)

url='https://xkbcommon.org'
source=("@${pkgname}~${pkgver}::https://github.com/xkbcommon/${pkgname}/archive/refs/tags/xkbcommon-${pkgver}.tar.gz")
sha256sums=('0427585a4d6ca17c9fc1ac4b539bf303348e9080af70c5ea402503bc370a9631')
repology=("project: ${pkgname}")
maintainer=('Oren Klopfer <oren@taumoda.com>')

build() {
  cd "${pkgname}~${pkgver}"
  meson setup build
  ninja -C build -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
