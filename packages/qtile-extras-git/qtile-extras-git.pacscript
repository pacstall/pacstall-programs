name="qtile-extras-git"
pkgname="qtile-extras"
url="https://github.com/elParaguayo/qtile-extras.git"
license="MIT"
description="It is a list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer="Ruturajn <nanotiruturaj@gmail.com>"

pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
    sudo python3 setup.py install --root="${STOWDIR}/${name}"
}
