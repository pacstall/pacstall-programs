name="xcb-util-errors"
gives="lib${name}"
pkgver="1.0.1"
pkgdesc="XCB errors library"
homepage='https://cgit.freedesktop.org/xcb/util-errors/'
makedepends=("libtool" "xcb-proto" "xutils-dev" "autoconf" "autogen" "pkg-config" "libxcb1-dev" "python3")
url="https://xorg.freedesktop.org/archive/individual/lib/xcb-util-errors-${pkgver}.tar.xz"
hash="5628c87b984259ad927bacd8a42958319c36bdf4b065887803c9d820fb80f357"
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  ./configure --prefix=/usr
  make -j"${NCPU}"
}

package() {
  sudo DESTDIR="${pkgdir}" make install
  sudo install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${gives}/"
}
