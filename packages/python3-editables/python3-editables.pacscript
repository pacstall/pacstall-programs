pkgname="python3-editables"
pkgver="0.5"
pkgdesc='Python library for creating editable wheels'
arch=('any')
url='https://github.com/pfmoore/editables'
license=('MIT')
depends=('python3')
makedepends=('git' 'python3-build' 'python3-installer' 'python3-flit-scm')
_commit='2331418af764ef203959327354335c431978e70d'
source=("${pkgname}::git+https://github.com/pfmoore/editables#commit=${_commit}")
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

build() {
  cd "${pkgname}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 665 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

}
