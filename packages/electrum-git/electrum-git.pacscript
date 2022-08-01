name="electrum-git"
pkgname="electrum"
url="https://github.com/spesmilo/electrum.git"
build_depends="python3-setuptools"
depends="python3-pyqt5 python3 libsecp256k1-0 python3-cryptography"
breaks="${pkgname}-bin ${pkgname} ${pkgname}-app"
description="FOSS Bitcoin wallet written in Python - Git version"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
    true
}

build() {
    python3 setup.py build
}

install() {
    sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}
