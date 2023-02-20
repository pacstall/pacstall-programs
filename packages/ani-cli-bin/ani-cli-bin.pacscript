name="ani-cli-bin"
pkgname="ani-cli"
version="4.1"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli"
depends="grep sed wget mpv aria2 ffmpeg fzf"
hash="718b29903f622cc06e177769bf3b1783f7f82e0a57d4b5de106d604ee00b4449"
description="A cli tool to browse and play anime"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli.1"
  gzip -9n ani-cli.1
}

install() {
  sudo install -Dm755 "./ani-cli" "${STOWDIR}/${name}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${STOWDIR}/${name}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
