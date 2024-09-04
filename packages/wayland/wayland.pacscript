pkgname=wayland
pkgver=1.23.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/${pkgver}/downloads/wayland-${pkgver}.tar.xz")
sha256sums=('05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2')
depends=('libglib2.0-0' 'libffi8' 'libexpat1' 'libxml2')
makedepends=('meson' 'libxslt1-dev' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl' 'libffi-dev' 'libexpat1-dev' 'libxml2-dev' 'cmake' 'pkg-config')
provides=(libwayland-client0 libwayland-egl1 libwayland-server0 libwayland-cursor0 libwayland-dev libwayland-egl-backend-dev libwayland-doc libwayland-bin)
replaces=("${depends[@]}")

maintainer=("xdavius <xdavius@github.com>")

build() {
  cd "${pkgname}-${pkgver}"
  meson --prefix=/usr build
  meson compile -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  meson test -C build --print-errorlogs
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir "${pkgdir}"
  mkdir -p docs/share
  mv "${pkgdir}"/usr/share/{doc,man} docs/share
  install -Dm 644 "${pkgname}-${pkgver}"/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  mv docs "${pkgdir}/usr"
}
