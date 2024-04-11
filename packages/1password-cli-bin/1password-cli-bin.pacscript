pkgname="1password-cli-bin"
gives="1password-cli"
repology=("project: ${gives}")
pkgver="2.25.0"
source=("https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/${gives}_linux_amd64_v${pkgver}.zip")
pkgdesc="1Password CLI"
sha256sums=("6d6c85b23500b3167f80affd4dea6ed71abbee309ffdc9ca1d2689614b2c9d89")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
