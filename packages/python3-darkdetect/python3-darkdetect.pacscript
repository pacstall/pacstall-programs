_pkgname="darkdetect"
pkgname="python3-darkdetect"
pkgver="0.8.0"
pkgdesc='Detect OS Dark Mode from Python'
arch=('any')
url='https://github.com/albertosottile/darkdetect'
maintainer=("MrDuartePT <gonegrier.duarte@gmail.com>")
license=('BSD-1-Clause')
depends=('python3')
makedepends=(
  'git'
  'python3-build'
  'python3-installer'
  'python3-wheel'
  'python3-setuptools'
)
source=("https://github.com/albertosottile/darkdetect/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('100eea1a610bb19610a68b11ff468c13b1c2863d1254c2d5b37d198a1beb3227')

build() {
  cd "${_pkgname}-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
