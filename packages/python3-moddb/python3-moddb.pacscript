pkgname="python3-moddb"
gives="python3-moddb"
arch=("any")
pkgver="0.11.0"
pkgdesc='A Python scraper to access ModDB mods, games and more as objects'
url='https://github.com/ClementJ18/moddb'
license=('MIT')
depends=(
  python3-bs4
  python3-requests
)
makedepends=(
  python3-build
  python3-installer
  python3-setuptools
  python3-wheel
)
source=("https://github.com/ClementJ18/moddb/archive/refs/tags/v0.11.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/moddb-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/moddb-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-moddb/
}
