name="obquit-git"
pkgname="obquit"
description="Utility script for logging out of a session, inspired by Oblogout"
url="https://github.com/dglava/${pkgname}.git"
depends=("python3-distutils" "python3-cairo" "python-gi-dev")
breaks=("${pkgname}" "${pkgname}-bin")
maintainer="Lanius <laniusone@pm.me>"
pkgver() {
  git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master .
}
version="$(pkgver)"

install() {
  # Install obquit
  sudo python3 setup.py install --root="${pkgdir}"
}
