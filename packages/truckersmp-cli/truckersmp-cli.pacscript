pkgname="truckersmp-cli"
gives="truckersmp-cli"
arch=("any")
pkgver=0.10.2.1
repology=("project: truckersmp-cli")
breaks=("${gives}-git")
pkgdesc="A simple launcher to play ATS and ETS2 with Multiplayer through TruckersMP."
source=("@${pkgname}~${pkgver}::https://github.com/truckersmp-cli/truckersmp-cli/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("2ad23c29e7a497c75067a98651962b27a0437bbd3759f517752e1a9b2dc65851")
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
