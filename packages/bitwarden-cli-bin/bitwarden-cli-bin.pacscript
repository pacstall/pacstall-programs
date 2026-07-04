pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="2026.5.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/bw-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("5ddbf5383bec9c71613d7b699ffa5249b5e7b68b2a3d15b4c75738ba8a8f9a19")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ./bw -t "${pkgdir}/usr/bin"
  ./bw completion --shell zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_bw"
}
