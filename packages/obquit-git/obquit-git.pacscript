name="obquit-git"
gives="obquit"
pkgdesc="Utility script for logging out of a session, inspired by Oblogout"
url="https://github.com/dglava/${gives}.git"
pkgver="0.0.1"
depends=("python3-distutils" "python3-cairo" "python-gi-dev")
breaks=("${gives}" "${gives}-bin")
maintainer="Lanius <laniusone@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

package() {
  # Install obquit
  sudo python3 setup.py install --root="${pkgdir}"
}
