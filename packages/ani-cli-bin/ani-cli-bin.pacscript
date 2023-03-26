name="ani-cli-bin"
pkgname="ani-cli"
version="4.2"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli"
depends="grep sed wget mpv aria2 ffmpeg fzf"
hash="d56494f0e84bf568a41a21472b982058c2a922c900e3efc09f56c01f47a601f1"
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
