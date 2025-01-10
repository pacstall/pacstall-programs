pkgname="truckersmp-cli"
gives="truckersmp-cli"
arch=("any")
pkgver=0.10.1
repology=("project: truckersmp-cli")
breaks=("${gives}-git")
pkgdesc="A simple launcher to play ATS and ETS2 with Multiplayer through TruckersMP."
source=("@${pkgname}~${pkgver}::https://github.com/truckersmp-cli/truckersmp-cli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("3f5e0289d06d5bdc39f86879283c7184adaa60eb06a3b4e481095da816121c16")
maintainer=("badlydrawnface <bdface@proton.me>")
makedepends=("python3-setuptools" "gcc-mingw-w64" "libsdl2-dev")
depends=("python3" "libsdl2-2.0-0")
optdepends=(
  "python3-vdf: automatic steam account detection"
  "steam: possibility to use proton"
  "wine: possibility to use wine"
)

build() {
  cd "${pkgname}~${pkgver}"
  make
  python3 setup.py build
}

package() {
  cd "${pkgname}~${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 "${gives}.bash" "${pkgdir}/usr/share/bash-completion/completions/${gives}"
  install -Dm644 "_${gives}" "${pkgdir}/usr/share/zsh/site-functions/_${gives}"
}
