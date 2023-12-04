name="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
pkgver="2023.7.0"
url="https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/${gives}-linux-${pkgver}.zip"
breaks=("${gives}-git")
replace=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
hash="15bd4f7cc8e0b6a3d29a319bcad30d011e590698e5e0dc1e54e7950619b98024"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm755 "bw" -t "${pkgdir}/usr/bin"
}
