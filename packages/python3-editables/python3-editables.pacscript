pkgname=python3-editables
gives=python3-editables
pkgver=0.5
pkgrel=5
pkgdesc='Python library for creating editable wheels'
arch=('any')
url='https://github.com/pfmoore/editables'
license=('MIT')
depends=('python3')
makedepends=(
  'git'
  'python3-build'
  'python3-installer'
  'python3-flit-scm'
)
_commit='2331418af764ef203959327354335c431978e70d'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')
maintainer=("xdavius <xdavius@github.com>")

build() {
  cd "${pkgname}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"

  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  # symlink license file
  # shellcheck disable=SC2155
  local site_packages=$(python3 -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
}
