pkgname=waynergy
pkgver=0.0.17
pkgdesc="Synergy client for wayland compositors"
arch=('amd64')
url='https://github.com/r-c-f/waynergy'
license=("MIT")
depends=("libwayland-client0" "libxkbcommon0" "libtls28t64 | libtls26 | libtls22")
makedepends=("git" "meson" "ninja-build" "libwayland-dev" "libxkbcommon-dev" "libtls-dev" "cmake" "pkg-config")
optdepends=(
  "wl-clipboard: Clipboard synchronization support"
  "gnome-session: Idle inhibition for GNOME"
)
maintainer=("Eric Renfro <psi-jack@linux-help.org>")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye")
source=("${pkgname}-${pkgver}.tar.gz@${pkgname}~${pkgver}::https://github.com/r-c-f/waynergy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("b8b2d12588cabfe161ce21a5cd898f06bdfd55c0106ecd4a26c8628aafeff990")
build() {
  cd "${pkgname}~${pkgver}"
  meson build --prefix="/usr"
  ninja -C build -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
