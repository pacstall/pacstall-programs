name="ani-cli-bin"
pkgname="ani-cli"
pkgver="4.5"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${pkgver}/ani-cli"
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
hash="77d133e4f7f5a7b93b9ce013f4d9663b70cb4343ea02fa4f22f1f5b3fd841153"
pkgdesc="A cli tool to browse and play anime"
maintainer="Elsie19 <hwengerstickel@pm.me>"

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
