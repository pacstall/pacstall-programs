pkgname="rnnoise"
arch=('amd64')
pkgver="0.2"
source=("https://github.com/xiph/rnnoise/releases/download/v${pkgver}/rnnoise-${pkgver}.tar.gz")
sha256sums=("90fce4b00b9ff24c08dbfe31b82ffd43bae383d85c5535676d28b0a2b11c0d37")
conflicts=("${pkgname}-git")
pkgdesc="Noise suppression library based on a recurrent neural network"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('BSD-3-Clause')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-x86-rtcd
}

build() {
  cd "${pkgname}-${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
