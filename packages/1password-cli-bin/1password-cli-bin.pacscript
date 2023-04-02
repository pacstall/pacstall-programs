name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.16.1"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="ad5d9661b50693116f4f85b3c3287f900ac1473303a61ff95604946b7be6082f"
arch=('amd64')

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
