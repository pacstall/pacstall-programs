_name="zombie-imp"
pkgname=python3-"${_name}"
arch=("any")
pkgver=0.0.4
pkgdesc='A copy of the imp module that was removed in Python 3.12'
url="https://github.com/encukou/${_name}"
license=('GPL-3.0-or-later')
depends=('python3')
makedepends=('python3-build' 'python3-installer' 'python3-setuptools' 'python3-wheel')
source=("https://github.com/encukou/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('03212d32abd41d58d08fcafdaa77ba5fe951ec75ca1558a45e6cd17f344cefdbf92fb487e401f17c43a4835dbca0bab49fff60fc9e5afb561b39a74d87fbf14c')
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
