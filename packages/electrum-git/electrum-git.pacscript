pkgname="electrum-git"
gives="electrum"
source=("https://github.com/spesmilo/electrum.git")
arch=("all")
pkgver="4.6.2"
makedepends=("libsecp256k1-dev" "python3" "python3-setuptools")
depends=("python3-pyqt5" "python3-cryptography")
breaks=("${gives}-bin" "${gives}" "${gives}-app")
maintainer=("amadv <aaronmadved@gmail.com>")
pkgdesc="FOSS Bitcoin wallet written in Python - Git version"

build() {
  cd "electrum"
  python3 setup.py build
}

package() {
  cd "electrum"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
