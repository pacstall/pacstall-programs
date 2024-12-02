pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.30.3"
source=("@${pkgname}~${pkgver}::https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("a16307ebcecb40fd091d7a6ff4f0c380c3c0897c4f4616de2c5d285e57d5ee28")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 op -t "${pkgdir}/usr/bin"
}
