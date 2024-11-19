pkgname="python3-pypresence"
gives="python3-pypresence"
arch=("any")
pkgver="4.3.0"
pkgdesc="Discord RPC and Rich Presence wrapper library"
url='https://github.com/qwertyquerty/pypresence'
license=("MIT")
depends=("python3")
makedepends=(
  "python3-build"
  "python3-installer"
  "python3-setuptools"
  "python3-sphinx"
  "python3-wheel"
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('958a5bb2f28c3120c89c68cc242abd8e72e2dac9aaf9be36b7c7a6217dcf4669')
maintainer=("xdavius <xdavius@github.com>")

_name="pypresence"
_archive="${_name}-${pkgver}"

build() {
  cd "${_archive}"

  python3 -m build --wheel --no-isolation

  sphinx-build -b man docs/sphinx man
}

package() {
  cd "${_archive}"

  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/pypresence.1

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
