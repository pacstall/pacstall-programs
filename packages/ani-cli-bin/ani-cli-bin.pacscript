pkgname="ani-cli-bin"
gives="ani-cli"
arch=("amd64")
pkgver="5.0"
repology=("project: ${gives}")
source=(
  "https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
  "ani-cli.1::https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli.1"
)
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
sha256sums=(
  "985716cd7ca1a27031f2db8adc9d99addbf3eb56d25cb35f8ea23f93081476f8"
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
