pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="2025.11.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v${pkgver}/bw-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("943f0107b3a471e7376b08f118e21a59583afeb49e4eb86f378e3b0d7c79c969")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ./bw -t "${pkgdir}/usr/bin"
  ./bw completion --shell zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_bw"
}
