pkgname="bitwarden-cli-bin"
gives="bitwarden-cli"
repology=("project: ${gives}")
arch=("amd64")
pkgver="2026.6.0"
source=("https://github.com/bitwarden/clients/releases/download/cli-v2026.6.0/bw-linux-${pkgver}.zip")
breaks=("${gives}-git")
replaces=("${gives}")
pkgdesc="Bitwarden's command-line interface - Binary"
sha256sums=("392549496c712ab86bfbd6c27302df9fd2c431cfc7a47e26941ac3e3893f4d27")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  install -Dm755 ./bw -t "${pkgdir}/usr/bin"
  ./bw completion --shell zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_bw"
}
