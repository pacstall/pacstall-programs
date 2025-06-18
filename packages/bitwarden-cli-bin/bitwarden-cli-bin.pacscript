pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="2025.5.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/bw-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("b3b2896a54caedc799813e1eb076b4358f72b1201e5065a90dd34dddcebccebe")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ./bw -t "${pkgdir}/usr/bin"
}
