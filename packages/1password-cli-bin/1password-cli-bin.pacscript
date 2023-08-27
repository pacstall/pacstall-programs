name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
pkgver="2.19.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/${gives}_linux_amd64_v${pkgver}.zip"
pkgdesc="1Password CLI"
hash="1d5d084f58a7308d36dd1d1717b32629394e806b72c21ddee9573f9e02fbd5d3"
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
