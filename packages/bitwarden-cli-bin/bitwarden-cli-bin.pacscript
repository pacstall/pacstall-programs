name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
pkgver="2023.7.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/${gives}-linux-${pkgver}.zip"
breaks=("${pkgname}-git")
replace=("${pkgname}")
pkgdesc="Bitwarden's command-line interface - Binary"
hash="15bd4f7cc8e0b6a3d29a319bcad30d011e590698e5e0dc1e54e7950619b98024"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
