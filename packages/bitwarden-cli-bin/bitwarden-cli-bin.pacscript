name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
version="2023.2.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${version}/${gives}-linux-${version}.zip"
breaks="${pkgname}-git"
replace="${pkgname}"
description="Bitwarden's command-line interface - Binary"
hash="ada7c8a08cb5dfa93748f7a266cf1a2485851dbbc4f3de33ee99c050f2f93183"
maintainer="Henryws <hwengerstickel@pm.me>"

install() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
