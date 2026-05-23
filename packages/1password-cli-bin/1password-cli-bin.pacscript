pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.32.1"
source=("@${pkgname}~${pkgver}::https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("64a49db2d1b0333f3bee88546e3e84995e530e25f2c783fb5d4081d01a05b2a1")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 op -t "${pkgdir}/usr/bin"
}
