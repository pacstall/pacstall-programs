pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="2025.12.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/bw-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("0a5ea0c81aedae91f29a5a316d01c73af4a7275db4fad56d069eb90e28b1c55f")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ./bw -t "${pkgdir}/usr/bin"
  ./bw completion --shell zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_bw"
}
