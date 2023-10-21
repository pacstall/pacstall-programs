name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
pkgver="2.21.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/${gives}_linux_amd64_v${pkgver}.zip"
pkgdesc="1Password CLI"
hash="3f891ad2ad7a460f1db533e7e006916637232ec0c428b4caa9d6080e3f60eea0"
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
