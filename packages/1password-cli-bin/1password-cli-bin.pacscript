name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
pkgver="2.20.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/${gives}_linux_amd64_v${pkgver}.zip"
pkgdesc="1Password CLI"
hash="bd041e12085ac94d855b8ec72534071e5a98bb4f1bcdb7ba8a29f7bb75cefb80"
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
