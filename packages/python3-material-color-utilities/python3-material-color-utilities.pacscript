pkgname="python3-material-color-utilities"
_name="material-color-utilities-python"
arch=("any")
pkgver="0.1.5"
pkgdesc="Python port of material-color-utilities used for Material You colors"
url='https://github.com/avanishsubbiah/material-color-utilities-python'
license=('Apache-2.0')
depends=('python3-pillow' 'python3-regex')
makedepends=('python3-build' 'python3-installer' 'python3-poetry' 'python3-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('cf444831fec962caae3a1871b8331dcdd055f186754631185140842e49e1dc5526c5aedc021d28cd5e192e6f593774abce34e4a2853049e9ded2cf3ca9b79e3f')
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${_name}-${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
}
