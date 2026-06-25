pkgname="ani-cli-bin"
gives="ani-cli"
arch=("amd64")
pkgver="4.13"
repology=("project: ${gives}")
source=(
  "https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
  "ani-cli.1::https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli.1"
)
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
sha256sums=(
  "17c8a97b034d3e48ba4663d538a5705adfbbffb951fa67650a57f7e4414959e2"
  "SKIP"
)
pkgdesc="A cli tool to browse and play anime"
maintainer=("Elsie19 <elsie19@pm.me>")

prepare() {
  cd "${srcdir}"
  chmod +x ani-cli
  gzip -9n "${srcdir}"/ani-cli.1
}

package() {
  cd "${srcdir}"
  install -Dm755 "./ani-cli" "${pkgdir}/usr/bin/ani-cli"
  install -Dm644 "./ani-cli.1.gz" "${pkgdir}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
