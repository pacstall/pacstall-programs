name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.16.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="ba2ec6413953a0d4eba933b32a6602a30d03998b50927610f1977b66e1351a9a"
arch=('amd64')

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
