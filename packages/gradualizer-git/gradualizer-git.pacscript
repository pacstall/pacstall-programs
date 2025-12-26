pkgname="gradualizer-git"
gives="gradualizer"
pkgver="0.3.0"
pkgdesc="Gradual type system for Erlang"
arch=('any')
repology=("project: ${gives}")
url='https://github.com/josefs/Gradualizer'
license=('MIT')
depends=('erlang')
makedepends=('git' 'make' 'erlang')
conflicts=("${gives}")
source=("${gives}::https://github.com/josefs/Gradualizer.git")
sha256sums=('SKIP')
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")

build() {
  make -C "${srcdir}/${gives}" -j"${NCPU}" escript
}

check() {
  make -C "${srcdir}/${gives}" tests
}

package() {
  install -Dm755 "${srcdir}/${gives}/bin/${gives}" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/${gives}/LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}
