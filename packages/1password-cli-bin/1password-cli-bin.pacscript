pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.34.1"
source=("@${pkgname}~${pkgver}::https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("b13ed106335419ea0fb0ebd7ebbb3b48cf26a2f214eb4b2fd8d950548e7980ed")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 op -t "${pkgdir}/usr/bin"
}
