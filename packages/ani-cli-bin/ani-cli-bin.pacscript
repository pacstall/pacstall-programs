name="ani-cli-bin"
pkgname="ani-cli"
pkgver="4.7"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
hash="375d65816b68ae6dfec10b2059cf022401c3880e4d8e9d3af587caa721fef143"
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
