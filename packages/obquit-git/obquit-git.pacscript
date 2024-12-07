pkgname="obquit-git"
gives="obquit"
pkgdesc="Utility script for logging out of a session, inspired by Oblogout"
source=("https://github.com/dglava/${gives}.git")
arch=("any")
pkgver="0.0.1"
depends=("python3-distutils" "python3-cairo" "python-gi-dev")
breaks=("${gives}" "${gives}-bin")
maintainer=("Lanius <laniusone@pm.me>")

package() {
  cd "obquit"
  # Install obquit
  python3 setup.py install --root="${pkgdir}"
}
