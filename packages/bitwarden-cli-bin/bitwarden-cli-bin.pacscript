name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
version="2023.5.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${version}/${gives}-linux-${version}.zip"
breaks="${pkgname}-git"
replace=("${pkgname}")
description="Bitwarden's command-line interface - Binary"
hash="6df2bf2a7015e5b603bfa1bfd53c71373140bb43061f31489b005d56494b1008"
maintainer="Elsie19 <hwengerstickel@pm.me>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
