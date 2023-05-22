name="ani-cli-bin"
pkgname="ani-cli"
version="4.3"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli"
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
hash="3a537ec15d49fbde9e7a656638659cfb99d2f949267b0c4d05e7f0b5d372207f"
description="A cli tool to browse and play anime"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli.1"
  gzip -9n ani-cli.1
}

install() {
  sudo install -Dm755 "./ani-cli" "${pkgdir}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${pkgdir}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
