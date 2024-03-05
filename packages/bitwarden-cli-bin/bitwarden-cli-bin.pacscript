name="bitwarden-cli-bin"
pkgname="bitwarden-cli"
gives="bw"
repology=("project: ${pkgname}")
pkgver="2024.1.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/${gives}-linux-${pkgver}.zip")
breaks=("${pkgname}-git")
replaces=("${pkgname}")
pkgdesc="Bitwarden's command-line interface - Binary"
hash=("05c906bf3709151ffcd063624047c327086f80f6b0256ded6a8bcaea044fdb02")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
