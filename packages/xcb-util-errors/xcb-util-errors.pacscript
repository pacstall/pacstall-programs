pkgname="xcb-util-errors"
gives="lib${pkgname}"
provides=("libxcb-errors0" "libxcb-errors-dev")
replaces=("${provides[@]}")
conflicts=("${provides[@]}")
arch=("any")
pkgver="1.0.1"
pkgrel="2"
pkgdesc="XCB errors library"
url='https://cgit.freedesktop.org/xcb/util-errors/'
makedepends=("libtool" "xcb-proto" "xutils-dev" "autoconf" "autogen" "pkg-config" "libxcb1-dev" "python3")
source=("https://xorg.freedesktop.org/archive/individual/lib/${pkgname}-${pkgver}.tar.xz")
sha256sums=("5628c87b984259ad927bacd8a42958319c36bdf4b065887803c9d820fb80f357")
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" make install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${gives}/"
}
