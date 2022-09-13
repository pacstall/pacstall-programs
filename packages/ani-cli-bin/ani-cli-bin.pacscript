name="ani-cli-bin"
pkgname="ani-cli"
version="3.4"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli"
hash="8dcefc128f239c2bb792986930deac947a6d5eda1815004832d999d80b719e68"
description="A cli tool to browse and play anime"
maintainer="TwilightBlood <hwengerstickel@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli.1.gz"
}

build() {
  true
}

install() {
  sudo install -Dm755 "./ani-cli" "${STOWDIR}/${name}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${STOWDIR}/${name}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
