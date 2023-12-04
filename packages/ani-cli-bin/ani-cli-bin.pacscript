name="ani-cli-bin"
gives="ani-cli"
pkgver="4.6"
repology=("project: ${gives}")
url="https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
hash="681a600c6d7133f83c493ab3ded0ec2dff2b04371c371613d1dd498380a247c9"
pkgdesc="A cli tool to browse and play anime"
maintainer="Elsie19 <elsie19@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli.1"
  gzip -9n ani-cli.1
}

package() {
  sudo install -Dm755 "./ani-cli" "${pkgdir}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${pkgdir}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
