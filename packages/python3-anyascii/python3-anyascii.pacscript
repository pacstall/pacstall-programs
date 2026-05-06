pkgname="python3-anyascii"
_name="${pkgname#python3-}"
arch=("any")
pkgver="0.3.3"
pkgdesc='Unicode to ASCII transliteration'
url=https://anyascii.com/
license=('ISC')
depends=('python3')
makedepends=('git' 'python3-build' 'python3-installer')
checkdepends=('python3-pytest')
pacdeps=('python3-flit-core')
source=("https://github.com/${_name}/${_name}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('b43e568664f4bcbc5fce976ed07bf6c7a40b475b1e06a8196f280cd66fa7eb45cc8786ede112da6e2176afc297df8e84edb9ce2de169a6a3e278eb625ea7b0a6')
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${_name}-${pkgver}"/impl/python
  python3 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_name}-${pkgver}"/impl/python
  python3 -m pytest
}

package() {
  cd "${_name}-${pkgver}"/impl/python
  python3 -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  site_packages=$(python3 -c "import site; print(site.getsitepackages()[0])")
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
