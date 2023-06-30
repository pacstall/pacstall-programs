name="ani-cli-bin"
pkgname="ani-cli"
version="4.4"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/${version}/ani-cli"
depends=("grep" "sed" "wget" "mpv" "aria2" "ffmpeg" "fzf")
hash="697b59d0a45318c81607e1502bc11cd9e0eef207c914a9b61a34daf684ff131d"
description="A cli tool to browse and play anime"
maintainer="Elsie19 <hwengerstickel@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://github.com/pystardust/ani-cli/releases/download/${version}/ani-cli.1"
  gzip -9n ani-cli.1
}

install() {
  sudo install -Dm755 "./ani-cli" "${pkgdir}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${pkgdir}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
