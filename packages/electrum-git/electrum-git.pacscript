name="electrum-git"
pkgname="electrum"
url="https://github.com/spesmilo/electrum.git"
build_depends=("python3-setuptools")
depends=("python3-pyqt5" "python3" "libsecp256k1-0" "python3-cryptography")
breaks=("${pkgname}-bin" "${pkgname}" "${pkgname}-app")
description="FOSS Bitcoin wallet written in Python - Git version"

pkgver() {
  mkdir tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master .
}
version="$(pkgver)"

build() {
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}
