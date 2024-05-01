pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
pkgver="2024.1.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/${gives}-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("05c906bf3709151ffcd063624047c327086f80f6b0256ded6a8bcaea044fdb02")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
