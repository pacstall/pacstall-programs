name="1password-cli-bin"
pkgname="1password-cli"
gives="op"
repology=("project: ${pkgname}")
version="2.18.0"
url="https://cache.agilebits.com/dist/1P/op2/pkg/v${version}/${gives}_linux_amd64_v${version}.zip"
description="1Password CLI"
hash="2baf610b476727f24c62cc843419f55b157e1a05521a698c1c8b4ed676a766aa"
arch=('amd64')

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
