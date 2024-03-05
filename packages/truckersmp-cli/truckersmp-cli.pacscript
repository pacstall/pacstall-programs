name="truckersmp-cli"
pkgname="truckersmp-cli"
pkgver=0.10.1
repology=("project: truckersmp-cli")
breaks=("${pkgname}-git")
gives="truckersmp-cli"
pkgdesc="A simple launcher to play ATS and ETS2 with Multiplayer through TruckersMP."
source=("https://github.com/truckersmp-cli/truckersmp-cli/archive/refs/tags/${pkgver}.tar.gz")
hash=("3f5e0289d06d5bdc39f86879283c7184adaa60eb06a3b4e481095da816121c16")
maintainer="badlydrawnface <bdface@proton.me>"
makedepends=("python3-setuptools" "gcc-mingw-w64" "libsdl2-dev")
depends=("python3" "libsdl2-2.0-0")
optdepends=(
  "python3-vdf: automatic steam account detection"
  "steam: possibility to use proton"
  "wine: possibility to use wine"
)

build() {
  make
  python3 setup.py build
}

package() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  sudo install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  sudo install -Dm644 "_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
