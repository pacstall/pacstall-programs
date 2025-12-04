pkgname="python-desktop-entry-lib"
gives="desktop-entry-lib"
pkgver="5.0"
pkgdesc="Library for working with .desktop files"
url='https://codeberg.org/JakobDev/desktop-entry-lib'
arch=('any')
license=('BSD-2-Clause')
depends=('python3' 'xdg-user-dirs' 'desktop-file-utils')
maintainer=("aKqir24 <aKqir24@github.com>")
makedepends=(
  'python3'
  'furo'
  'python3-sphinx-copybutton'
  'python3-setuptools'
  'python3-wheel'
  'python3-build'
  'python3-sphinx'
  'python3-installer'
  'python3-ftputil'
  'make'
)
optdepends=("python3-jeepney: Install desktop entries using xdg-desktop-portal")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/${gives}/archive/${pkgver}.tar.gz")
sha256sums=("726f4a654f4e4c4c17242245bc5f17595990d3b4928c16fa6b9140ccea31f7db")

build() {
  cd "${gives}"
  python3 -m build --wheel --no-isolation

  cd docs
  make man html
}

package() {
  cd "${gives}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "docs/_build/man/desktop-entry-lib.1" -t "${pkgdir}/usr/share/man/man1"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs/_build/html/* "${pkgdir}/usr/share/doc//${pkgname}"
}
