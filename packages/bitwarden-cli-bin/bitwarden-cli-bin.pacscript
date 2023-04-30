name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
version="2023.4.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${version}/${gives}-linux-${version}.zip"
breaks="${pkgname}-git"
replace=("${pkgname}")
description="Bitwarden's command-line interface - Binary"
hash="7333bf62c228f3347bda1d7c00fb34749df6095b923554726b7c7ff97aa096b7"
maintainer="Henryws <hwengerstickel@pm.me>"

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
