pkgname="python3-anyascii"
_name="${pkgname#python3-}"
arch=("any")
pkgver="0.3.2"
pkgdesc='Unicode to ASCII transliteration'
url=https://anyascii.com/
license=('ISC')
depends=('python3')
makedepends=('git' 'python3-build' 'python3-installer')
checkdepends=('python3-pytest')
pacdeps=('python3-flit-core')
source=("https://github.com/${_name}/${_name}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('9b9440d26872404487ff791dda5e7695f5f8504743d750c89b80d2a77595decfb2f1389b6636af8723a358b0e56988f074acb403d7860539c522cfa4b5b3f06a')
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
