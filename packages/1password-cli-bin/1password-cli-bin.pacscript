pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.34.0"
source=("@${pkgname}~${pkgver}::https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("198b05dcf9a0972778ce5a4e262c459979b0c837257b5da65e2fba6187734226")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 op -t "${pkgdir}/usr/bin"
}
