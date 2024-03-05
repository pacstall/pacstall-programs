name="obquit-git"
pkgname="obquit"
pkgdesc="Utility script for logging out of a session, inspired by Oblogout"
source=("https://github.com/dglava/${pkgname}.git")
pkgver="0.0.1"
depends=("python3-distutils" "python3-cairo" "python-gi-dev")
breaks=("${pkgname}" "${pkgname}-bin")
maintainer="Lanius <laniusone@pm.me>"

package() {
  # Install obquit
  sudo python3 setup.py install --root="${pkgdir}"
}
