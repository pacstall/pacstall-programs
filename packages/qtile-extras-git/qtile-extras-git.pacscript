name="qtile-extras-git"
pkgname="qtile-extras"
url="https://github.com/elParaguayo/qtile-extras.git"
pkgver="0.22.1"
license="MIT"
pkgdesc="It is a list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

package() {
  sudo python3 setup.py install --root="${pkgdir}"
}
