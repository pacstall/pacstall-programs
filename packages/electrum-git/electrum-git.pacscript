name="electrum-git"
gives="electrum"
url="https://github.com/spesmilo/electrum.git"
pkgver="4.4.5"
makedepends=("python3-setuptools")
depends=("python3-pyqt5" "python3" "libsecp256k1-0" "python3-cryptography")
breaks=("${gives}-bin" "${gives}" "${gives}-app")
pkgdesc="FOSS Bitcoin wallet written in Python - Git version"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  python3 setup.py build
}

package() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}
