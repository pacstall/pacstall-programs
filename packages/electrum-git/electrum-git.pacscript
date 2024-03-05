name="electrum-git"
pkgname="electrum"
source=("https://github.com/spesmilo/electrum.git")
pkgver="4.4.5"
makedepends=("python3-setuptools")
depends=("python3-pyqt5" "python3" "libsecp256k1-0" "python3-cryptography")
breaks=("${pkgname}-bin" "${pkgname}" "${pkgname}-app")
pkgdesc="FOSS Bitcoin wallet written in Python - Git version"

build() {
  python3 setup.py build
}

package() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}
