name="ani-cli-bin"
pkgname="ani-cli"
version="4.0"
repology=("project: ${pkgname}")
url="https://github.com/pystardust/ani-cli/releases/download/v${version}/ani-cli"
hash="a98b78a3515c06014b572b3c49c1d8bfff6944d15b72fd8157c14ea1501ee0ab"
description="A cli tool to browse and play anime"
maintainer="Henryws <hwengerstickel@pm.me>"

prepare() {
  chmod +x ani-cli
  wget -q "https://raw.githubusercontent.com/pystardust/ani-cli/master/ani-cli.1"
  gzip -9n ani-cli.1
}

install() {
  sudo install -Dm755 "./ani-cli" "${STOWDIR}/${name}/usr/bin/ani-cli"
  sudo install -Dm644 "./ani-cli.1.gz" "${STOWDIR}/${name}/usr/share/man/man1/ani-cli.1.gz"
}
# vim:set ft=sh ts=2 sw=2 et:
