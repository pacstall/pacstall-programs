pkgname="hyfetch-git"
gives="hyfetch"
pkgdesc="Neofetch with LGBTQ pride flags."
url="https://github.com/hykilpikonna/hyfetch"
source=("https://github.com/hykilpikonna/hyfetch.git")
maintainer=("pythoncrazy <pinakpaliwal07@gmail.com>")
pkgver="1.4.11"
depends=('python3')
makedepends=('python3-pip')
external_connection="true"

build() {
  cd "${_archive}"
  pip install .
}

package() {
  cd "${_archive}"
  chmod +x neofetch
  chmod +x hyfetch/scripts/neowofetch
  /usr/bin/python3 setup.py install --root="${pkgdir}" --optimize=1
}
