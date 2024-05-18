pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.28.0"
source=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/op_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("a0732965d86c4429b508d1f00531359936a50d62f78b01fc2df964d9f5f47982")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 op -t "${pkgdir}/usr/bin"
}
