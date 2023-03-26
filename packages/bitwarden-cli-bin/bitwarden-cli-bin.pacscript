name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
version="2023.3.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${version}/${gives}-linux-${version}.zip"
breaks="${pkgname}-git"
replace="${pkgname}"
description="Bitwarden's command-line interface - Binary"
hash="c5972a5c7fba3c86ab56d0bc4ba2eefc4a135b71fe9732aa1ee0e4bebe36c8ad"
maintainer="Henryws <hwengerstickel@pm.me>"

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
