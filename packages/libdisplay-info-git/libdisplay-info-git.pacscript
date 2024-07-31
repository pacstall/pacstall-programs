pkgname="libdisplay-info-git"
gives="libdisplay-info"
provides=("libdisplay-info1" "libdisplay-info-dev")
replaces=("libdisplay-info1" "libdisplay-info-dev")
breaks=("${replaces[@]}")
pkgver="0.1.1"
pkgdesc='EDID and DisplayID library'
url='https://gitlab.freedesktop.org/emersion/libdisplay-info'
arch=("amd64")
license=('MIT')
source=("git+https://gitlab.freedesktop.org/emersion/libdisplay-info")
sha256sums=('SKIP')
makedepends=("git" "hwdata" "meson" "ninja-build" "python3")
maintainer=("xdavius <xdavius@gmail.com>")

build() {
  meson --prefix=/usr libdisplay-info build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "libdisplay-info/LICENSE"
}
