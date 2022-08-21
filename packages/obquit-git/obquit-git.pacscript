name="obquit-git"
pkgname="obquit"
pkgdir="/usr/src/pacstall/${name}"
description="Utility script for logging out of a session, inspired by Oblogout"
url="https://github.com/dglava/${pkgname}.git"
depends="python3"
breaks="${pkgname} ${pkgname}-bin"
maintainer="Lanius <laniusone@pm.me>"

pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
  # Install obquit
  sudo python3 setup.py install --root="${pkgdir}"
}

postinst() {
  true
}

removescript() {
  true
}
