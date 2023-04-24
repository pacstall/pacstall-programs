name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.17.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="2f65fe356175288930215ae8fd03519ab43ab1db37d6b9938c8250a9eabfb657"
arch=('amd64')

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
