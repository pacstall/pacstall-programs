pkgname="qbe"
pkgver="1.3"
arch=('any')
pkgdesc="Compiler backend that aims to provide 70% of the performance of industrial optimizing compilers in 10% of the code"
url='https://c9x.me/compile/'
maintainer=("Elsie19 <elsie19@pm.me>")
source=("https://c9x.me/compile/release/qbe-${pkgver}.tar.xz")
sha256sums=("d587905d620dc5e1d2bfa7c2cc642b9b837aa89a3188c6e37b53d756cf66e320")
makedepends=("gcc")
repology=("project: qbe")

build() {
  cd "qbe-${pkgver}"
  make -j"${NCPU}"
}

check() {
  cd "qbe-${pkgver}"
  make check
}

package() {
  cd "qbe-${pkgver}"
  DESTDIR="${pkgdir}" make install
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/licenses/${pkgname}/"
}
