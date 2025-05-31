pkgname="protonplus"
gives="protonplus"
_app_id="com.vysp3r.ProtonPlus"
pkgver="0.4.31"
pkgdesc="A modern compatibility tools manager for Linux"
arch=('x86_64')
url='https://github.com/Vysp3r/ProtonPlus'
license=('GPL-3.0-or-later')
depends=('libadwaita-1-0' 'libarchive-dev' 'libgee-0.8-dev' 'libgtk-4-dev' 'gettext')
makedepends=('meson'
  'valac'
  'gettext'
  'libadwaita-1-dev'
  'libarchive-dev'
  'libgee-0.8-dev'
  'libgtk-4-dev'
  'libjson-glib-dev'
  'libsoup-3.0-dev'
  'desktop-file-utils')
checkdepends=('appstream-util')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1abbf8053f37b2cc765c18cb2d5b355e687d25b32bbb1bd0426749295328b357')
maintainer=("Vysp3r <dev@vysp3r.com>")

incompatible=("debian:bookworm" "ubuntu:jammy")

prepare() {
  mkdir -p "ProtonPlus-${pkgver}"/build
}

build() {
  cd "ProtonPlus-${pkgver}"
  meson --prefix=/usr build
  meson compile -C build
}

check() {
  cd "ProtonPlus-${pkgver}"
  meson test -C build --print-errorlogs || :
}

package() {
  cd "ProtonPlus-${pkgver}"
  meson install -C build --destdir "${pkgdir}"

  ln -s "/usr/bin/${_app_id}" "${pkgdir}/usr/bin/${pkgname}"
}
