pkgname="lib32-wayland"
gives="lib32-wayland"
pkgver=1.23.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('i386')
url='https://wayland.freedesktop.org/'
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/${pkgver}/downloads/wayland-${pkgver}.tar.xz")
sha256sums=('05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2')
depends=('libglib2.0-0' 'libffi8' 'libexpat1' 'libxml2')
makedepends=('meson' 'pkg-config' 'cmake' 'libxslt1-dev' 'doxygen' 'xmlto' 'graphviz' 'docbook-xsl' 'libglib2.0-dev' 'libffi-dev' 'libexpat1-dev' 'libxml2-dev')
provides=(libwayland-client0="${pkgver}"
  libwayland-egl1="${pkgver}"
  libwayland-server0="${pkgver}"
  libwayland-cursor0="${pkgver}"
  libwayland-dev="${pkgver}"
  libwayland-egl-backend-dev="${pkgver}"
  libwayland-doc="${pkgver}"
  libwayland-bin"${pkgver}")
replaces=(libwayland-client0 libwayland-egl1 libwayland-server0 libwayland-cursor0 libwayland-dev libwayland-egl-backend-dev libwayland-doc libwayland-bin)

maintainer=("xdavius <xdavius@github.com>")

build() {
  cd "wayland-${pkgver}"
  meson --prefix=/usr build
  meson compile -C build
}

check() {
  cd "wayland-${pkgver}"
  meson test -C build --print-errorlogs
}

package() {
  cd "wayland-${pkgver}"
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  rm -fr "${pkgdir:?}"/usr/{include,bin,share}

  echo "Multi-Arch: same" >> "${pkgdir}"/DEBIAN/control
}
