pkgname="protonvpn-cli"
breaks="${pkgname}-git"
replaces=("${pkgname}")
repology=("project: ${pkgname}")
arch=("any")
pkgver="3.13.0"
source=("@${pkgname}~${pkgver}::https://github.com/ProtonVPN/linux-cli/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("python3-setuptools")
depends=("python3-dialog")
pacdeps=("protonvpn-nm-lib" "proton-python-client")
pkgdesc="Official ProtonVPN Linux app (CLI)"
sha256sums=("d295d6c899638a88d615e2cacb078ecf2aee8c771ebb087c9edb43aea25aacd9")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
