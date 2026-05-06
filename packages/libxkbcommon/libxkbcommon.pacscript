pkgname='libxkbcommon'
arch=('any')
pkgver='1.13.1'
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
sha256sums=('aeb951964c2f7ecc08174cb5517962d157595e9e3f38fc4a130b91dc2f9fec18')
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
