pkgname=python3-sphinx-hawkmoth
gives=python3-sphinx-hawkmoth
pkgver=0.19.0
pkgrel=2
pkgdesc="Sphinx autodoc C extension"
url="https://github.com/jnikula/hawkmoth"
arch=(x86_64)
license=(BSD-2-Clause)
maintainer=("xdavius <xdavius@github.com>")
depends=(
  clang
  python3
  python3-docutils
  python3-sphinx
  python3-clang
)
makedepends=(
  git
  python3-build
  python3-hatchling
  python3-installer
  python3-setuptools
  python3-wheel
)
pacdeps=("python3-editables")
source=("${pkgname}::https://github.com/jnikula/hawkmoth/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('baf4d68c834a8cf3651c242b2e9be2b6c0f47f265648380f5eccbec2a7cc8667')

build() {
  cd "hawkmoth-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "hawkmoth-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
