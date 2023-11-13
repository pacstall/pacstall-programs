name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
pkgver="2.22.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${pkgver}/${gives}_linux_amd64_v${pkgver}.zip"
pkgdesc="1Password CLI"
hash="cadcd9b95216ffb6f0ff866ab915c59de3d5f652830e7eb3c5aea868191d7b1f"
arch=('amd64')
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
