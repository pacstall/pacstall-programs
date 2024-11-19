_name="zombie-imp"
pkgname=python3-"${_name}"
arch=("any")
pkgver=0.0.2
pkgdesc='A copy of the imp module that was removed in Python 3.12'
url="https://github.com/encukou/${_name}"
license=('GPL-3.0-or-later')
depends=('python3')
makedepends=('python3-build' 'python3-installer' 'python3-setuptools' 'python3-wheel')
source=("https://github.com/encukou/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('25fcb8633dab3f5b8546ec0bfaf82e0c6a17373ec4c5d87219d1e93aeaac8deeae2b68c827edbd2b2aecb8a900a516d0819493c241e64a2217b8626a8a0155af')
compatible=("*:noble" "*:oracular" "*:trixie" "*:sid" "*:devel")
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${_name}-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
