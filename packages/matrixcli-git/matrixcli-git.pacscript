name="matrixcli-git"
pkgname="matrixcli"
repology=("project: ${pkgname}")
url="https://github.com/saadsolimanxyz/matrixcli.git"
build_depends="python3-setuptools"
depends="python3"
breaks="${pkgname}"
description="Simple matrix client based on the matrix-python-sdk"
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
