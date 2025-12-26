pkgname="ani-cli-bin"
gives="ani-cli"
arch=("amd64")
pkgver="4.10"
repology=("project: ${gives}")
source=(
  "https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
  "ani-cli.1::https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli.1"
)
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
sha256sums=(
  "38599dc5bb65a5b9f78e936ed42ffe16b62095dbc6621a5b578ed3e29aac4f3e"
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
