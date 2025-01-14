pkgname=python3-sphinx-hawkmoth
gives=python3-sphinx-hawkmoth
pkgver=0.19.0
pkgrel=2
pkgdesc='Sphinx autodoc C extension'
url='https://github.com/jnikula/hawkmoth'
arch=("any")
license=('BSD-2-Clause')
maintainer=("xdavius <xdavius@github.com>")
depends=('clang' 'python3' 'python3-docutils' 'python3-sphinx' 'python3-clang')
makedepends=('git' 'python3-build' 'python3-hatchling' 'python3-installer' 'python3-setuptools' 'python3-wheel')
pacdeps=("python3-editables")
source=("${pkgname}::https://github.com/jnikula/hawkmoth/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('998b1d031383b8993b20622f851b88e787a71c0ece41f86d996c1402a3ef42ae')

build() {
  cd "hawkmoth-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "hawkmoth-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
