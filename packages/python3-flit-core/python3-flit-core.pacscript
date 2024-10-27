_parent_name="flit"
_name="${_parent_name}_core"
pkgname="python3-${_name/_/-}"
arch=("any")
pkgver="3.9.0"
pkgdesc="A PEP 517 build backend for packages using Flit"
url="https://github.com/pypa/${_parent_name}/tree/main/${_name/-/_}"
_url="https://github.com/pypa/${_parent_name}"
license=('BSD-3-Clause')
depends=('python3')
makedepends=(
  'python3-build'
  'python3-installer'
)
checkdepends=(
  'python3-pytest'
  'python3-testpath'
)
source=("${_parent_name}-${pkgver}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('bae3baf324016e25f8422a79c60b91c3a6f3422ca57b20c3585444c912dfaca23b73e147912d503b9b78f69bbb7db861ab926b29ff081c5c75ada155e914c4a3')
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${_parent_name}-${pkgver}/${_name}"
  python3 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_parent_name}-${pkgver}/${_name}"
  pytest -vv
}

package() {
  site_packages=$(python3 -c "import site; print(site.getsitepackages()[0])")

  cd "${_parent_name}-${pkgver}/${_name}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # remove tests
  rm -frv "${pkgdir}/${site_packages}/${_name}/tests/"
  # remove vendored tomli
  rm -frv "${pkgdir}/${site_packages}/${_name}/vendor/"
}
