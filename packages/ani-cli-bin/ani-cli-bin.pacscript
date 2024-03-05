name="ani-cli-bin"
pkgname="ani-cli"
pkgver="4.8"
repology=("project: ${pkgname}")
source=(
  "https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
  "https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli.1"
)
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
hash=(
  "4a21690493b4aee4165f1881b19d9d696c9f56c5687940e587c542c6caa7c6fe"
  "SKIP"
)
pkgdesc="A cli tool to browse and play anime"
maintainer="Elsie19 <elsie19@pm.me>"

prepare() {
  chmod +x ani-cli
  gzip -9n ani-cli.1
}

package() {
  sudo install -Dm755 "./ani-cli" "${pkgdir}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${pkgdir}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
