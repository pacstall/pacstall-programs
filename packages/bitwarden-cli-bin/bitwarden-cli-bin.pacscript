pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="2026.7.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v2026.7.0/bw-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("7a35145e205952f7434d2370da359543145ae0c45ba1af0fe9bdd99d40a00180")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ./bw -t "${pkgdir}/usr/bin"
  ./bw completion --shell zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_bw"
}
