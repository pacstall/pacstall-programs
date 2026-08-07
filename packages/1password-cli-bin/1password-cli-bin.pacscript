pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.38.1"
source=("@${pkgname}~${pkgver}::https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("7a7b7168f521d31838f0cc59abf172527853308c9b9cceee34895121acb0be0f")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 op -t "${pkgdir}/usr/bin"
}
