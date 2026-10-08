pkgname="cmatrix"
arch=("any")
pkgver="2.0"
source=("@${pkgname}~${pkgver}::https://github.com/abishekvashok/cmatrix/archive/v${pkgver}.tar.gz")
makedepends=("autoconf" "make" "cmake" "libncurses5-dev" "libncursesw5-dev")
pkgdesc="Terminal based The Matrix like implementation"
sha256sums=("ad93ba39acd383696ab6a9ebbed1259ecf2d3cf9f49d6b97038c66f80749e99a")
maintainer=("Elsie19 <elsie19@pm.me>")
repology=("project: ${pkgname}")

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../"${pkgname}~${pkgver}" \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
  #-D CONSOLE_FONTS_DIRS=/usr/share/kbd/consolefonts \
  #-D X_FONTS_DIRS=/usr/share/fonts/misc \
  #-D UNIX=true
  make -j"${NCPU}"
}

package() {
  # only the binary has a target to install
  make -C build DESTDIR="${pkgdir}" install

  cd "${pkgname}~${pkgver}"

  # install X font
  install -D -m644 mtx.pcf "${pkgdir}/usr/share/fonts/misc/mtx.pcf"

  # install console font
  install -D -m644 matrix.fnt "${pkgdir}/usr/share/kbd/consolefonts/matrix.fnt"
  install -D -m644 matrix.psf.gz "${pkgdir}/usr/share/kbd/consolefonts/matrix.psf.gz"

  for i in AUTHORS NEWS COPYING README ChangeLog INSTALL; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"
  done

  install -Dm644 cmatrix.1 "${pkgdir}/usr/share/man/man1/cmatrix.1"

}
